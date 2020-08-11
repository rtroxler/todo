Rails.application.routes.draw do
	root 'projects#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :projects do
    resources :tasks do
      get 'complete', to: 'tasks#complete', as: 'complete'
      get 'uncomplete', to: 'tasks#uncomplete', as: 'uncomplete'
    end
  end
end
