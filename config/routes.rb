Rails.application.routes.draw do
  get 'cookware/index'
  get 'cookware/create'
  get 'cookware/update'
  get 'cookware/destroy'
  get 'ingredients/show'
  get 'ingredients/new'
  get 'ingredients/create'
  get 'ingredients/edit'
  get 'ingredients/update'
  get 'ingredients/destroy'
  devise_for :users do
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :brands
  resources :addresses
  resources :restaurants do
    resources :orders, only: [:index]
  end
  resources :kits, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :guides, only: [:new, :create]
    resources :kit_ingredients, only: [:index, :new, :create]
    resources :kit_cookwares, only: [:index, :create, :new]
    resources :cookwares, only: [:index, :create]
    resources :orders, only: [:create, :new]
    resources :ingredients, only: [:create]
    collection do
      get "category"
    end
  end

  resources :stores, only: :show

  resources :orders, only: [:index, :show, :edit, :update] do
    resources :payments, only: [:create, :show, :new]
    resources :reviews, only: [:new, :create]
  end
  resources :guides, only: [:show, :edit, :update, :destroy] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only: [:update, :destroy]
  resources :kit_ingredients, only: [:show, :edit, :update] do
    resources :ingredients, only: [:new, :create]
  end
  resources :kit_cookwares, only: [:show, :edit, :update]
  resources :cookwares, only: [:update, :destroy]

  resources :ingredients, only: [:update, :destroy]

  get "/failed/:id", to: "payments#failed", as: :failed
  get "/components/", to: "pages#components", as: :components
  get "/user_dashboard/", to: "pages#user_dashboard", as: :user_dashboard
  get "/admin_dashboard/", to: "pages#admin_dashboard", as: :admin_dashboard
  get "/wrong_address/", to: "pages#wrong_address", as: :wrong_address
  get "/contact/", to: "pages#contact", as: :contact
  patch "/orders/:id/order_assignment/", to: "orders#order_assignment", as: :order_assignment
  delete 'kits/:id', to: "kits#destroy"


  # /dashboard/orders
  # orders [index ]
  # favorites [index]
  # # location [show new create update edit destroy]
  # namespace :user do
  #   resources :orders, only: :index
  # end
end
