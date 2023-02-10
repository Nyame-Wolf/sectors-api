Rails.application.routes.draw do
  resources :industries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "industries#index"
end
