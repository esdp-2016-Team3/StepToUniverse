Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Ckeditor::Engine => '/ckeditor'

  root 'pages#homepage'

  resources :questions
  resources :teacher_times

  get 'lessons/new/:id' => 'lessons#new', as: 'new_lesson'
  get 'lessons/show/:id' => 'lessons#show', as: 'show_lesson'
  post 'lessons/create' => 'lessons#create', as: 'create_lesson'

  get '/timetable/:id' => 'teacher_times#timetable', as: 'timetable'
  
  delete '/library_file/:id/delete' => 'library_files#destroy', as: 'library_file_destroy'
  post '/library_file/create' => 'library_files#create', as: 'library_file_create'

  post '/homework_results/result_homework' => 'homework_results#result_homework', as: 'result_homework'
  get '/teacher_homeworks' => "pages#teacher_homeworks", as: 'teacher_homeworks' 
  get '/my_students' => "pages#my_students", as: 'my_students' 
  get '/teacher_literature' => "pages#teacher_literature", as: 'teacher_literature'  
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

  get 'show_result_homework/:id' => 'homework_results#show_result_homework_question', as: 'show_result_question'

  get 'show/:id' => 'homeworks#show_homework', as: 'show_homework'
  get '/new_homework' => 'homeworks#new_homework', as: 'new_homework'
  get '/accepted_homeworks' => 'homeworks#accepted_homeworks', as: 'accepted_homeworks'
  get 'show_student_homework/:id' => 'homeworks#show_student_homework', as: 'show_student_homework'
  get '/new_homework_question' => 'homeworks#new_homework_question', as: 'new_homework_question'  
  post '/homework/create_homework_question' => 'homeworks#create_homework_question', as: 'create_homework_question'
  post '/homework/create' => 'homeworks#create', as: 'homework_create'
  post '/homework/send' => 'homeworks#assign', as: 'hw_assignment_create'
  post '/homework/finish' => 'homeworks#result', as: 'hw_result_create'
  get '/homework/:id/check' => 'homeworks#check', as: 'hw_check'
  put '/student_cabinet/:id' => 'homeworks#update_hwassignment', as: 'update_hwassignment'
  put '/homework/:id/update' => 'homeworks#homework_update', as: 'homework_update'
  get '/record' => 'homeworks#record', as: 'record'

end
