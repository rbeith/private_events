Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

	root "events#index"

	resources :events, only: [:new, :create, :index, :show, :edit, :update, :destroy]
	resources :users, only: [:show, :edit, :destroy]
	resources :event_attendances, only: [:new, :create, :destroy]
end
