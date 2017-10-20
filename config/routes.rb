Rails.application.routes.draw do
  root 'home#home'
  get     '/',                        to: 'home#home'
  get     '/signup',                  to: 'users#new'
  get     '/login',                   to: 'sessions#new'
  post    '/login',                   to: 'sessions#create'
  delete  '/logout',                  to: 'sessions#destroy'
  get     '/notifications',           to: 'notifications#notifications'
  get     '/profile',                 to: 'users#show'
  get     '/profile/edit',            to: 'settings#edit_user'
  get     '/profile/request',         to: 'requests#new'
  
  get     '/discover',                to: 'discover#main'
  get     '/settings',                to: 'settings#index'
  get     '/settings/profile',        to: 'settings#edit_user'
  get     '/settings/billing',        to: 'settings#edit_billing'
  get     '/settings/advanced',       to: 'settings#edit_advanced'
  get     '/settings/notifications',  to: 'settings#edit_notifications'

  resources :charges
  resources :users
  resources :requestss
end
