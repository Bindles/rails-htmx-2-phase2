Rails.application.routes.draw do
  resources :pokes
  root 'pokemon#index'
  get 'fetch_pokemon', to: 'pokemon#fetch_pokemon'
  get 'fetch_pokemont', to: 'pokemon#fetch_pokemont'
  get 'test_action', to: 'pokemon#test_action'
  match 'clear_pokemon', to: 'pokemon#clear_pokemon', via: [:get, :post]
  get 'page_two' => 'pokemon#page_two'
  get 'notices/show', to: 'notices#show', as: 'show_notice'
  get 'notices/sho', to: 'notices#sho', as: 'sho_notice'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end



    # collection do
    #   get 'fetch_pokemon_names'
    # end
