Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  get 'auth/logout', to: 'authentication#destroy'
  post 'signup', to: 'users#create'
  get 'me', to: 'users#me'
  put 'update', to: 'users#update'
  delete 'delete', to: 'users#destroy'

end
