Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  get "/about" => "home#about", as: :about

  resources :tasks
  resources :projects do
    resources :discussions do
      resources :comments
    end
  end

  root "home#index"
end
