Rails.application.routes.draw do

  get 'signup/main'

  get 'login/main'

  root 'home#home'
  get '/notifications', to: 'notifications#notifications'
  get '/profile', to: 'users#profile'
  get '/profile/request', to: 'requests#requests'
  get '/discover', to: 'discover#main'

end
