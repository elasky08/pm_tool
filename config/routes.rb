Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  get "/about" => "home#about", as: :about


  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :projects do
    resources :tasks#, shallow: true
    resources :discussions
  end

  resources :discussions do
    resources :comments #, shallow: true
  end

  root "home#index"
end
