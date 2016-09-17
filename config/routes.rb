Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :guests
  resources :guests
  
  root "guests#index"
  
  
  
end
