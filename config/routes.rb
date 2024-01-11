Rails.application.routes.draw do
  resources :articles, only: [:index, :create]
 
  get 'health', to: ->(env) {
  response = 'I am healthy'
  [200, {}, [response]] 
}
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
