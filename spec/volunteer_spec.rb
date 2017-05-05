require('spec_helper')

describe (Volunteer) do

  describe('#name') do
    it('tells you its name') do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      expect(volunteer.name()).to(eq('Felix'))
    end
  end

  describe('#id') do
    it('receives an id when saved') do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer.save()
      expect(volunteer.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it ("lets you save volunteers to the database") do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer.save()
      expect(Volunteer.all()).to(eq([volunteer]))
    end
  end

  describe("#==") do
    it("is the same volunteer if it has the same name") do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer2 = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      expect(volunteer).to(eq(volunteer2))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer.save()
      volunteer2 = Volunteer.new({:name => 'Rex', :skill => 'Dogs', :id => nil, :project_id => 2})
      volunteer2.save()
      expect(Volunteer.find(volunteer2.id())).to(eq(volunteer2))
    end
  end

  describe("#update") do
    it("lets you update volunteers names in the database") do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer.save()
      volunteer.update({:name => 'Morris'})
      expect(volunteer.name()).to(eq('Morris'))
    end
    it("lets you update volunteers skill in the database") do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer.save()
      volunteer.update({:skill => "Kittens"})
      expect(volunteer.skill()).to(eq("Kittens"))
    end
  end

  describe("#delete") do
    it("lets you delete a volunteer from the database") do
      volunteer = Volunteer.new({:name => 'Felix', :skill => 'Cats', :id => nil, :project_id => 1})
      volunteer.save()
      volunteer2 = Volunteer.new({:name => 'Rex', :skill => 'Dogs', :id => nil, :project_id => 2})
      volunteer2.save()
      volunteer.delete()
      expect(Volunteer.all()).to(eq([volunteer2]))
    end
  end
end
