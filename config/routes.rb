Rails.application.routes.draw do

      resources :users, except: [:new, :edit]
      resources :orders, except: [:new, :edit]
      get 'orders/by_date/:date', to: 'orders#by_date'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
