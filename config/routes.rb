Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
