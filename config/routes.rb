Rails.application.routes.draw do
  get 'header_images/create'
  devise_for :users


  resources :events do
  	resources :attendances, only: [:new, :create, :index]
  	resources :header_images, only: [:create]
  end
  
  resources :users

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
