Rails.application.routes.draw do
  root 'pages#home'
  get 'login', to: 'pages#login'
  post '/login', to: 'auth#login'
  get "profile" , to: "pages#profile"
  get 'register', to: 'pages#register'
  get 'invitations', to: 'pages#invitations'
  get 'transactions', to: 'pages#transactions'
  get "new" , to: "pages#newInvitation"
  get 'invitations/:id', to: 'pages#invitationDetail', as: 'invitation_detail'

  resources :invitations, only: [:create]
  resources :sellers, only: [:create]
  resources :transactions, only: [:show], param: :id


  get "up" => "rails/health#show", as: :rails_health_check

end
