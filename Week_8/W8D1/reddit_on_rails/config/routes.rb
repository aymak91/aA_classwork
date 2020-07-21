Rails.application.routes.draw do
  resources :users, only: [:new, :create, :index, :show] do
    resources :posts, only: [:create, :edit, :update, :destroy]
  end
  resources :subs
  resources :posts, only: [:new, :create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
