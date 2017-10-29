Rails.application.routes.draw do
  root 'home#home'
  get     '/',                        to: 'home#home'

<<<<<<< HEAD
  controller :users do
    get     '/profile/addPic',         to: 'users#addPic'
    patch    '/profile/addPic',         to: 'users#update'
    get     '/signup',                  to: 'users#new'
    get     '/profile',                 to: 'users#show'
  end

  controller :sessions do
    get     '/login',                   to: 'sessions#new'
    post    '/login',                   to: 'sessions#create'
    delete  '/logout',                  to: 'sessions#destroy'
    delete  '/profile',                  to: 'sessions#destroy'
  end

  controller :notifications do
    get     '/notifications',           to: 'notifications#notifications'
  end

  controller :settings do
    get     '/profile/edit',            to: 'settings#edit_user'
    get     '/settings',                to: 'settings#index'
    get     '/settings/profile',        to: 'settings#edit_user'
    get     '/settings/billing',        to: 'settings#edit_billing'
    get     '/settings/advanced',       to: 'settings#edit_advanced'
    get     '/settings/notifications',  to: 'settings#edit_notifications'
  end

  controller :portfolios do
    get     '/addPhoto',              to: 'portfolios#addPhoto'
    post    '/addPhoto' ,             to: 'portfolios#upload_images'
    post     '/portfolios',           to: 'portfolios#create'
    get      '/portfolios/edit',      to: 'portfolios#edit'
    get     'portfolios/delete'
  end

  controller :requests do
    get     '/requests',                to: 'requests#index'
    post     '/requests',                to: 'requests#decline'
    post     '/requests',                to: 'requests#comfrimed'
    post     '/requests',                to: 'requests#edit'
    post      '/decline',                to: 'requests#decline'
    get     '/profile/request',         to: 'requests#new'
    post     '/profile/request',         to: 'requests#create'
  end

  controller :discover do
    get     '/discover',                to: 'discover#main'
  end
=======
  get     '/profile',                 to: 'users#show'
  get     '/profile/request',         to: 'requests#new'
  post     '/profile/request',         to: 'requests#create'

  get     '/profile/addPic',         to: 'users#addPic'
  patch    '/profile/addPic',         to: 'users#update'


  get     '/requests',                to: 'requests#index'
  post     '/requests',                to: 'requests#decline'
  post     '/requests',                to: 'requests#comfrimed'
  post     '/requests',                to: 'requests#edit'
  post      '/decline',                        to: 'requests#decline'

  post     '/discover',                   to: 'discover#main'
  get     '/discover',                to: 'discover#main'
  get     '/settings',                to: 'settings#index'
  get     '/settings/profile',        to: 'settings#edit_user'
  get     '/settings/billing',        to: 'settings#edit_billing'
  get     '/settings/advanced',       to: 'settings#edit_advanced'
  get     '/settings/notifications',  to: 'settings#edit_notifications'

  post     '/portfolios',             to: 'portfolios#create'
  get      '/portfolios/edit',        to: 'portfolios#edit'
>>>>>>> fdfdfeb87b740efb0157aad043dfe34cf2e18a52

  resources :charges
  resources :users do
    resources :reviews
  end

  resources :portfolios
  resources :photos

end
