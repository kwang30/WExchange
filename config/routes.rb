Rails.application.routes.draw do
  root 'home#home'
  get '/notifications', to: 'notifications#notifications'
  get '/profile', to: 'users#profile'
  get '/profile/edit', to: 'settings#edit_user'
  get '/profile/request', to: 'requests#requests'



  get '/settings', to: 'settings#index'
  get '/settings/profile', to: 'settings#edit_user'
  get '/settings/card', to: 'settings#edit_billing'
  get '/settings/advanced', to: 'settings#edit_advanced'
  get '/settings/notifications', to: 'settings#edit_notifications'


  resources :charges
  resources :users
end
