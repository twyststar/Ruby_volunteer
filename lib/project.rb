class Project
  attr_reader(:id, :name, :description)

  def initialize (attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @description = attributes[:description]
  end

  def save
   result= DB.exec("INSERT INTO projects (name, description) VALUES ('#{@name}', '#{@description}') RETURNING id;")
   @id = result.first().fetch('id').to_i
  end

  def == (another_project)
    self.name() == another_project.name()
  end

  def self.all
    returned_projects = DB.exec('SELECT * FROM projects;')
    projects=[]
    returned_projects.each() do |project|
      @name = project.fetch('name')
      @description = project.fetch('description')
      @id = project.fetch('id').to_i()
      projects.push(Project.new({:name => @name, :description => @description, :id => @id}))
    end
    projects
  end

  def self.find (id)
    found_project = nil
    Project.all().each() do |project|
      if project.id().==(id)
        found_project = project
      end
    end
    found_project
  end

  def update  (attributes)
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{@id};")

    @description = attributes.fetch(:description, @description)
    @id = self.id()
    DB.exec("UPDATE projects SET description = '#{@description}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id()};")
  end
  
end
