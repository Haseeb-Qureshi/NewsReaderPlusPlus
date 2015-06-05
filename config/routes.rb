NewsReader::Application.routes.draw do
  namespace :api do
    resources :feeds, only: [:index, :create, :show, :destroy] do
      resources :entries, only: [:index]
    end
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy] do
      get "/authenticate", action: :authenticate
    end
  end

  root to: "static_pages#index"
end
