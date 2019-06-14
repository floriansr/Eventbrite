Rails.application.routes.draw do

  devise_for :users


  resources :events, except: [:index] do
  	resources :attendances, only: [:new, :create, :index]
  	resources :header_images, only: [:create]
  end

  resources :users, except: [:index] do
 	 resources :avatars, only: [:create]
  end

  root 'events#index'


  namespace :admin do
    resources :checkusers, except: [:update, :create] 
    resources :event_submissions, except: [:update, :create]
    root "admins#index"
  end
end
