class ProjectsController < ApplicationController

  def index
    @projects = Lighthouse::Project.find(:all)
  end
end
