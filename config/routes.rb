Rails.application.routes.draw do
  resources :articles, only: [:index, :create]
  get 'search', to: 'articles#search'
  get 'analytics', to: 'articles#analytics'


  get 'health', to: ->(env) {
  response = 'I am healthy'
  [200, {}, [response]] 
}
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
