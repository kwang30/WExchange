Rails.application.routes.draw do
  root 'home#home'
  get     '/',                        to: 'home#home'
  get     '/signup',                  to: 'users#new'
  get     '/login',                   to: 'sessions#new'
  post    '/login',                   to: 'sessions#create'
  delete  '/logout',                  to: 'sessions#destroy'
  get     '/notifications',           to: 'notifications#notifications'
  get     '/profile/edit',            to: 'settings#edit_user'

  get     '/profile',                 to: 'users#show'
  get     '/profile/request',         to: 'requests#new'
  post     '/profile/request',         to: 'requests#create'

  get     '/profile/addPic',         to: 'users#addPic'



  get     '/requests',                to: 'requests#index'
  post     '/requests',                to: 'requests#decline'
  post     '/requests',                to: 'requests#comfrimed'
  post     '/requests',                to: 'requests#edit'
  post      '/decline',                        to: 'requests#decline'


  get     '/discover',                to: 'discover#main'
  get     '/settings',                to: 'settings#index'
  get     '/settings/profile',        to: 'settings#edit_user'
  get     '/settings/billing',        to: 'settings#edit_billing'
  get     '/settings/advanced',       to: 'settings#edit_advanced'
  get     '/settings/notifications',  to: 'settings#edit_notifications'

  resources :charges
  resources :users
  resources :requests
end
