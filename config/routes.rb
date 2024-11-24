Rails.application.routes.draw do

  resources :posts do
    resources :comments    
  end
  
  resources :qcolors do
    post :move, on: :member
  end
  
  resources :wheelcolors
  resources :colors
  resources :pos do
    collection do
      get 'fetch_pot', to: 'pos#fetch_pot'    
    end
  end
  resources :pokes
  
  resources :items

  #default root =>
  #root 'pokemon#index'

  #temp root for testing =>
  root 'qcolors#index'

  #root 'pokemon#index'
  get 'index2' => 'items#index2'

  get 'alpine' => 'colors#alpine'
  get 'fetch_pokemon', to: 'pokemon#fetch_pokemon'
  get 'fetch_pokemont', to: 'pokemon#fetch_pokemont'
  get 'fetch_pokemontc', to: 'pokemon#fetch_pokemontc'
  get 'fetch_pokemonz', to: 'pokemon#fetch_pokemonz'
  get 'fetch_pokemonx', to: 'pos#fetch_pokemonx'

  get 'fetch_poke', to: 'pokes#fetch_poke'
  get 'test_action', to: 'pokemon#test_action'
  match 'clear_pokemon', to: 'pokemon#clear_pokemon', via: [:get, :post]
  match 'clear_pokemonx', to: 'pos#clear_pokemonx', via: [:get, :post]
  get 'page_two' => 'pokemon#page_two'
  get 'page_a' => 'pokemon#page_a'
  get 'page_b' => 'pokemon#page_b'
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
