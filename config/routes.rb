Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :ingrediente, only: [:index, :update]
  get 'disponibilidad_ingredientes' => 'ingrediente#disponibilidad_ingredientes'
  put 'ingrediente/:ingrediente' => 'ingrediente#update'
end
