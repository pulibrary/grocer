Grocer::Engine.routes.draw do
  resources :exports, only: [:create, :index, :new, :show]
  root to: 'exports#index'
end
