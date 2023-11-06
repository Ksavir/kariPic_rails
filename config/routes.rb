Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :photos do
    resources :comments, only: %i[create edit update destroy]
  end

  root 'photos#index'
end
