class ProjectsController < ApplicationController

  def index
    @projects = Lighthouse::Project.find(:all)
  end

  def show
    @project = Lighthouse::Project.find(params[:id])
    cond = "state:new sort:number " + (params[:query] || "tagged:vital")
    @tickets = @project.tickets(:q => cond)
  end
end
