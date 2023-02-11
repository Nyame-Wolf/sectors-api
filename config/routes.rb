Rails.application.routes.draw do
  resources :user_preferences
  resources :industries, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "industries#index"
end
