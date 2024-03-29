Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    resources :users
    resource :session, only: [:create, :destroy]
  end

  root to:'static_pages#root'

end
