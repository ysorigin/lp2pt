class ProjectsController < ApplicationController

  def index
    @projects = Lighthouse::Project.find(:all)
  end

  def show
    @project = Lighthouse::Project.find(params[:id])
  end
end
