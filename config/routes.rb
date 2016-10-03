Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#homepage'

  get '/result' => 'pages#result', as: 'result'

  get '/sample_test' => 'pages#sample_test', as: 'sample_test'

  get '/admin/user/accept' => 'acceptions#accept', as: 'accept'

  get '/admin/user/reject' => 'acceptions#reject', as: 'reject'

  devise_for :users, :controllers => {:confirmations => "confirmations"}
  
  resources :questions
end
