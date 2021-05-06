Rails.application.routes.draw do
  root to: 'tests#index'
  resources :tests
  get '/tests/:id/start', to: 'tests#start'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true
  end
end
