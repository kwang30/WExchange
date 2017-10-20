Rails.application.routes.draw do

# home and discover routes
  root 'home#home'
  get '/', to: 'home#home'
  get '/discover', to: 'discover#main'

  # login/signup routes
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # notifications routes
  get '/notifications', to: 'notifications#notifications'

  # profile routes
  get '/user', to: 'users#show'
  get '/user/edit', to: 'settings#edit_user'
  match '/users/:id', to: 'users#show', via: 'get'

  #requests routes
  get '/request', to: 'requests#new'



  # settings routes
  get '/settings', to: 'settings#index'
  get '/settings/profile', to: 'settings#edit_user'
  get '/settings/billing', to: 'settings#edit_billing'
  get '/settings/advanced', to: 'settings#edit_advanced'
  get '/settings/notifications', to: 'settings#edit_notifications'

  resources :charges
  resources :users
  resources :requests

end
