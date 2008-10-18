ActionController::Routing::Routes.draw do |map|
  map.resources :meetings
  map.resources :banners
  map.resources :images

  map.root :controller => 'welcome'
  map.admin 'admin', :controller => 'meetings'
end
