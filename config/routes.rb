Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # devise_for :users
      resources :characters, only: %i[index show create update destroy]
      resources :movies, only: %i[index show create update destroy]
      resources :series, only: %i[index show create update destroy]
      resources :users, only: %i[create]
    end
  end
end
