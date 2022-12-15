Rails.application.routes.draw do
  root 'tutorial_maps#index'

  # Aether Eggs Pages
  scope 'eggs' do
    # TUTORIAL PAGES
    get 'tutorial', to: 'tutorial_maps#index', as: 'tutorial'
    get 'tutorial/:mapname', to: 'tutorial_maps#map', as: 'tutorial_map'
    get 'tutorial/:mapname/:type/:id', to: 'tutorial_maps#steps', as: 'tutorial_steps'
    get 'tutorial/:mapname/:type/:id/edit', to: 'tutorial_maps#edit', as: 'tutorial_edit'

    # Bot Pages
    #
    get 'bot', to: 'bot#index', as: 'bot'
  end

  scope 'cup' do
  end
end
