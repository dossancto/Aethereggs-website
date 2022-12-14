Rails.application.routes.draw do
  root 'tutorial_maps#index'

  # Tutorial Pages
  get 'tutorial', to: 'tutorial_maps#index'
  get 'tutorial/:mapname', to: 'tutorial_maps#map', as: 'tutorial_map'
  get 'tutorial/:mapname/:type/:id', to: 'tutorial_maps#steps', as: 'tutorial_steps'

  # Edit Tutorial Pages
  get 'tutorial/:mapname/:type/:id/edit', to: 'tutorial_maps#edit', as: 'tutorial_edit'
end
