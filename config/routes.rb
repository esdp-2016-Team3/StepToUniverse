Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#homepage'

  get '/literature_list' => 'pages#literature_list', as: 'literature_list'

  get '/cabinet' => 'pages#cabinet', as: 'cabinet'

  get '/result' => 'pages#result', as: 'result'

  get '/sample_test' => 'pages#sample_test', as: 'sample_test'

  get '/admin/user/accept' => 'acceptions#accept', as: 'accept'

  get '/admin/user/reject' => 'acceptions#reject', as: 'reject'

  devise_for :users, :controllers => {:confirmations => "confirmations"}

  get '/content/:id', to: 'contents#show', as: 'content'
  
  resources :questions
  resources :surveys

  post '/text_file/create' => 'files#create', as: 'text_file_create'

  post '/homework/create' => 'homeworks#create', as: 'homework_create'

  post '/homework/send' => 'homeworks#assign', as: 'hw_assignment_create'

  delete '/text_file/:id/delete' => 'files#destroy', as: 'text_file_destroy'

end
