require('spec_helper')

describe (Project) do

  describe('#name') do
    it('tells you its name') do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      expect(project.name()).to(eq('Kitten Wash'))
    end
  end

  describe('#id') do
    it('receives an id when saved') do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project.save()
      expect(project.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it ("lets you save projects to the database") do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project.save()
      expect(Project.all()).to(eq([project]))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project2 = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      expect(project).to(eq(project2))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project.save()
      project2 = Project.new({:name => 'Puppy Wash', :description => 'Clean up messy little puppies for adoption.', :id => nil})
      project2.save()
      expect(Project.find(project2.id())).to(eq(project2))
    end
  end

  describe("#update") do
    it("lets you update projects names in the database") do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project.save()
      project.update({:name => "Clean Kitties"})
      expect(project.name()).to(eq("Clean Kitties"))
    end
    it("lets you update projects desciptions in the database") do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project.save()
      project.update({:description => "Clean Kitties"})
      expect(project.description()).to(eq("Clean Kitties"))
    end
  end

  describe("#delete") do
    it("lets you delete a list from the database") do
      project = Project.new({:name => 'Kitten Wash', :description => 'Clean up messy little kittens for adoption.', :id => nil})
      project.save()
      project2 = Project.new({:name => 'Puppy Wash', :description => 'Clean up messy little puppies for adoption.', :id => nil})
      project2.save()
      project.delete()
      expect(Project.all()).to(eq([project2]))
    end
  end

end
