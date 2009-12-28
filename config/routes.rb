ActionController::Routing::Routes.draw do |map|

  map.root :controller => "projects", :action => :index
  map.resource :project
  map.with_options(:controller => :projects) do |x|
    x.create_story '/projects', :action => "create_story", :conditions => {:method => :post}
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
