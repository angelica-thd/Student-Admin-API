Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  get 'auth/logout', to: 'authentication#destroy'
  post 'signup', to: 'users#create'
  get 'me', to: 'users#me'
  put 'update', to: 'users#update'
  delete 'delete', to: 'users#destroy'
  post 'signup/student', to: 'students#create'
  post 'find/student', to: 'students#show'
  put 'update/student', to: 'students#update'
  delete 'delete/student', to: 'students#destroy'

end
