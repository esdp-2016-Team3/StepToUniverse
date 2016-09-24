Rails.application.routes.draw do

  root 'pages#homepage'

  get '/admin/user/accept' => 'acceptions#accept', as: 'accept'

  get '/admin/user/reject' => 'acceptions#reject', as: 'reject'

  devise_for :users
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


end
