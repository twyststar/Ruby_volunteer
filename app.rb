require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker'})
get('/') do
  erb(:landing)
end
get('/index') do
  @projects = Project.all()
  erb(:index)
end

post("/projects") do
  name = params.fetch("name")
  description = params.fetch('description')
  project = Project.new({:name => name, :description => description, :id => nil})
  project.save()
  @projects = Project.all()
  erb(:index)
end
delete('/projects_clear') do
  Project.clear()
  @projects = Project.all()
  erb(:index)
end
delete("/volunteer_clear/:id") do
  @project = Project.find(params.fetch('id').to_i())
  @project.remove()
  @volunteers = Volunteer.all()
  erb(:single_project)
end

get('/single_project/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @volunteers = Volunteer.all()
  erb(:single_project)
end

patch('/single_project/:id') do
  name = params.fetch("new_name")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:name => name})
  @volunteers = Volunteer.all()
  erb(:single_project)
end
patch('/single_project_desc/:id') do
  description = params.fetch('description')
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:description => description})
  @volunteers = Volunteer.all()
  erb(:single_project)
end
delete('/single_project/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @volunteers = Volunteer.all()
  @projects = Project.all()
  erb(:index)
end

post('/volunteers') do
  name = params.fetch("name")
  skill = params.fetch('skill')
  project_id = params.fetch('project_id').to_i()
  volunteer = Volunteer.new({:name => name, :skill => skill, :id => nil, :project_id => project_id})
  volunteer.save()
  @volunteers = Volunteer.all()
  @project = Project.find(project_id)
  erb(:single_project)
end

get('/single_volunteer/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i())
  erb(:single_volunteer)
end

patch('/single_volunteer/:id') do
  name = params.fetch("name")
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.update({:name => name})
  @volunteers = Volunteer.all()
  erb(:single_volunteer)
end

patch('/single_volunteer_skill/:id') do
  skill = params.fetch('skill')
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @volunteer.update({:skill => skill})
  @volunteers = Volunteer.all()
  erb(:single_volunteer)
end

delete('/single_volunteer/:id') do
  @volunteer = Volunteer.find(params.fetch("id").to_i())
  @project_id = @volunteer.project_id().to_i()
  @volunteer.delete()
  @volunteers = Volunteer.all()
  @project = Project.find(@project_id)
  erb(:single_project)
end
