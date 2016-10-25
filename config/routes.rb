Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#homepage'

  get '/teachers' => 'pages#teachers', as: 'teachers'

  resources :questions
  resources :surveys
  
  get '/teacher_literature' => "pages#teacher_literature", as: 'teacher_literature'
  delete '/library_file/:id/delete' => 'library_files#destroy', as: 'library_file_destroy'
  post '/library_file/create' => 'library_files#create', as: 'library_file_create'
  
  get '/cabinet' => 'pages#cabinet', as: 'cabinet'

  get '/result' => 'pages#result', as: 'result'
  get '/sample_test' => 'pages#sample_test', as: 'sample_test'

  get '/admin/user/accept' => 'acceptions#accept', as: 'accept'
  get '/admin/user/reject' => 'acceptions#reject', as: 'reject'

  devise_for :users, :controllers => {:confirmations => "confirmations"}
  get '/content/:id', to: 'contents#show', as: 'content'  

  get '/literature_list' => 'pages#literature_list', as: 'literature_list'

  post '/homework/create' => 'homeworks#create', as: 'homework_create'
  post '/homework/send' => 'homeworks#assign', as: 'hw_assignment_create'
  post '/homework/finish' => 'homeworks#result', as: 'hw_result_create'
  put '/homework/:id/check' => 'homeworks#check', as: 'hw_check'

end
