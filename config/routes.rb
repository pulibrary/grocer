Grocer::Engine.routes.draw do
  namespace :grocer do
    resources :exports
  end
  root to: 'home#index'
end
