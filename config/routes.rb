Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#homepage'

  resources :questions
  
  delete '/library_file/:id/delete' => 'library_files#destroy', as: 'library_file_destroy'
  post '/library_file/create' => 'library_files#create', as: 'library_file_create'

  get '/new_homework' => 'pages#new_homework', as: 'new_homework'
  get '/teacher_homeworks' => "pages#teacher_homeworks", as: 'teacher_homeworks' 
  get '/my_students' => "pages#my_students", as: 'my_students' 
  get '/teacher_literature' => "pages#teacher_literature", as: 'teacher_literature'  
  get '/accepted_homeworks' => 'homeworks#accepted_homeworks', as: 'accepted_homeworks'
  get '/literature_list' => 'pages#literature_list', as: 'literature_list'
  get '/teachers' => 'pages#teachers', as: 'teachers'
  get '/student_cabinet/:id' => 'pages#student_cabinet', as: 'student_cabinet'
  get '/teacher_cabinet' => 'pages#teacher_cabinet', as: 'teacher_cabinet'
  get '/result' => 'pages#result', as: 'result'
  get '/sample_test' => 'pages#sample_test', as: 'sample_test'

  get '/admin/user/accept' => 'acceptions#accept', as: 'accept'
  get '/admin/user/reject' => 'acceptions#reject', as: 'reject'

  devise_for :users, :controllers => {:confirmations => "confirmations"}
  get '/content/:id', to: 'contents#show', as: 'content'  

  get 'show_student_homework/:id' => 'homeworks#show_student_homework', as: 'show_student_homework'
  get '/new_homework_question' => 'homeworks#new_homework_question', as: 'new_homework_question'  
  post '/homework/create_homework_question' => 'homeworks#create_homework_question', as: 'create_homework_question'
  post '/homework/create' => 'homeworks#create', as: 'homework_create'
  post '/homework/send' => 'homeworks#assign', as: 'hw_assignment_create'
  post '/homework/finish' => 'homeworks#result', as: 'hw_result_create'
  put '/homework/:id/check' => 'homeworks#check', as: 'hw_check'
  delete '/homework/:id/delete' => 'homeworks#destroy', as: 'homework_destroy'
  get '/record' => 'homeworks#record', as: 'record'

end
