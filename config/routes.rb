Harmonize::Application.routes.draw do

  root :to => 'main_pages#dashboard'
  match '/about', to: 'main_pages#about', via: 'get'

  resources :projects, :contacts, :events
end
