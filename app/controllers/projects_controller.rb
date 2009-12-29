class ProjectsController < ApplicationController

  before_filter :find_pt, :except => :index

  def index
    @projects = Lighthouse::Project.find(:all)
  end

  def show
    @project = Lighthouse::Project.find(params[:id])
    cond = "state:new sort:number " + (params[:query] || "tagged:vital")
    @tickets = @project.tickets(:q => cond)
    @stories = @pt.stories
  end

  def create_story
    @story = Story.new(params[:story])
    @pt.create_story(@story)
    params[:sid].nil? ? (redirect_to :action => :show, :id => params[:id]) : (render :text =>'OK')
  end

  private
  def find_pt
    @pt ||= PivotalTracker.new(LP2PT_ID[params[:id]], PTTOKEN, :ssl => true)
  end
end
