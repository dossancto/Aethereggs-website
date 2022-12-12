Rails.application.routes.draw do
  get 'tutorial', to: 'tutorial_maps#index'
  get 'tutorial/:mapname', to: 'tutorial_maps#map', as: 'tutorial_map'
  get 'tutorial/:mapname/:type/:id', to: 'tutorial_maps#steps', as: 'tutorial_steps'

  get 'mapa/', to: 'tutorial_mapa#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tutorial_maps#index'
end
