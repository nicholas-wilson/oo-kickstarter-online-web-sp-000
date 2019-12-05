class Project
  attr_accessor :title, :backers

  def initialize(title)
    @title = title
    @backers = []
  end

  def add_backer(backer)
    @backers << backer
    has_project = false
    backer.projects.each do |project|
      if project.backers.include?(backer)
        has_project = true
      end
    end
    if !has_project
      backer.add_project(self)
    end
  end
end
