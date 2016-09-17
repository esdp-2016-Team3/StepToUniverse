Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :guests 
  # do
  # 	root "devise/registrations#new"
  # end
   
end
