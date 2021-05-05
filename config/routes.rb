Rails.application.routes.draw do
  root to: 'tests#index'
  resources :tests
  get '/tests/:id/start', to: 'tests#start'

  get '/tests/:test_id/questions', to: 'questions#index'

  post '/tests/:test_id/questions', to: 'questions#create'

  # get '/questions', to: 'questions#redirect'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true, only: %i[index show new]
  end
end
