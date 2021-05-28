Rails.application.routes.draw do
  devise_for :users
  root to: 'tests#index'

  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :logout, action: :destroy, controller: 'sessions'

  # resources :users, only: :create
  # resources :sessions, only: %i[create delete]

  resources :tests do
    resources :questions, shallow: true, expect: :index do
      resources :answers, shallow: true, expect: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[update show] do
    member do
      get :result
    end
  end
end
