Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  get 'auth/logout', to: 'authentication#destroy'


end
