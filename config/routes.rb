Rails.application.routes.draw do
  get 'term', to: 'hotels#term'
  get 'privacy', to: 'hotels#privacy'
  
  root  'hotels#index' 
  resources :hotels, only: [:index, :new] 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
