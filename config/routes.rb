Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  get "/about" => "home#about", as: :about


  resources :projects do
    resources :tasks, shallow: true
    resources :discussions
  end

  resources :discussions, only: [] do
    resources :comments #, shallow: true
  end

  root "home#index"
end
