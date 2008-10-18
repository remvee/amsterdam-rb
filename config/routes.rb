ActionController::Routing::Routes.draw do |map|
  map.resources :meetings

  map.root :controller => "welcome"

  map.resources :banners
  map.resources :images

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
