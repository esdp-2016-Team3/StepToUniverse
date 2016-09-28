Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'pages#homepage'

  get '/admin/user/accept' => 'acceptions#accept', as: 'accept'

  get '/admin/user/reject' => 'acceptions#reject', as: 'reject'

  devise_for :users, :controllers => {:confirmations => "confirmations"}
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
