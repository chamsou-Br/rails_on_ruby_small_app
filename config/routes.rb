Rails.application.routes.draw do
  root 'pages#home'
  get 'login', to: 'pages#login'
  post '/login', to: 'auth#login'
  get '/logout', to: 'auth#logout'
  get "profile" , to: "pages#profile"
  get 'register', to: 'pages#register'
  get 'invitations', to: 'pages#invitations'
  get 'transactions', to: 'pages#transactions'
  get "new" , to: "pages#newInvitation"
  get 'invitations/:id', to: 'pages#invitationDetail', as: 'invitation_detail'
  get 'export/users', to: 'pages#exportUsers' , as: 'export_users'
  get 'export/roles', to: 'pages#exportRoles' , as: 'export_roles'
  get 'export/resource', to: 'pages#exportResource' , as: 'export_resource'

  resources :invitations, only: [:create]
  resources :sellers, only: [:create]
  resources :transactions, only: [:show], param: :id


  get "up" => "rails/health#show", as: :rails_health_check

end
