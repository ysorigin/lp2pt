class ProjectsController < ApplicationController

  before_filter :find_pt, :except => :index

  def index
    @projects = Lighthouse::Project.find(:all)
  end

  def show
    @project = Lighthouse::Project.find(params[:id])
    cond = "state:new sort:number " + (params[:query] || "tagged:vital")
    @ticketss = @project.tickets(:q => cond)
    @stories = @pt.stories
    @stories_l = []
    @stories.each do |storie|
      @stories_l << storie.name.scan(/#\d+/).to_s
    end
    @tickets = []
    @ticketss.each do |ticket|
     @tickets << ticket if !@stories_l.include?("##{ticket.id.to_s}")
    end
  end

  def create_story
    @story = Story.new(params[:story])
    @pt.create_story(@story)
    params[:sid].nil? ? (redirect_to params[:back_to]) : (render :text =>'OK')
  end

  private
  def find_pt
    @pt ||= PivotalTracker.new(LP2PT_ID[params[:id]], PTTOKEN, :ssl => true)
  end
end
