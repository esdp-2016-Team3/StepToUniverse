Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
<<<<<<< HEAD
  
  devise_for :guests
  resources :guests
  
  root "guests#index"
  
  
  
=======
  devise_for :guests 
  # do
  # 	root "devise/registrations#new"
  # end
   
>>>>>>> e841a2f1ab5d9fc0a9e166cd2f771359a45cbf07
end
