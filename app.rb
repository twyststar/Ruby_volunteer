require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
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

get('/single_project/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @volunteers = Volunteer.all()
  erb(:single_project)
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
