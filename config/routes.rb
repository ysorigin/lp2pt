ActionController::Routing::Routes.draw do |map|

  map.root :controller => "projects", :action => :index
  map.resource :project
  map.with_options(:controller => :projects) do |x|
    x.create_story '/projects', :action => "create_story", :method => :post
    x.anatole "/project/:id/anatole", :action => :show, :query => "responsible:anatole"
    x.vital "/project/:id/vital", :action => :show, :query => "tagged:vital"
    x.importance "/project/:id/important", :action => :show, :query => "tagged:important"
    x.nice "/project/:id/nice", :action => :show, :query => "tagged:nice"
    x.felix "/project/:id/felix", :action => :show, :query => "responsible:felix"
  end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
