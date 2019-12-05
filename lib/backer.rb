class Backer
  attr_accessor :name, :backed_projects

  def initialize(name)
    @name = name
    @backed_projects = []
  end

  def back_project(project)
    @backed_projects << project
    has_backer = false
    project.backers.each do |backer|
      if backer.projects.include?(project)
        has_backer = true
      end
    end
    if !has_backer
      project.add_backer(self)
    end
  end
end
