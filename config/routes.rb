Rails.application.routes.draw do
  root 'posts#index'
  get 'rooms/index'
  get 'rooms/search' => 'rooms#search'
  get 'reservations/confirm' => 'reservations#confirm'
  get 'users/owner' => 'users#owner'
  get 'users/reservations' => 'users#reservations'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'accounts'
    end
  end
  resources :reservations do
    collection do
      get :confirm
      post :save
    end
  end

  patch '/reservations/:id', to: 'reservations#update', as: 'update_reservation'
  resources :rooms do
    resources :reservations, only: [:new, :create, :edit ]
  end

  get '/mypage' => 'users#mypage'
  get 'posts/index'

  get 'users/:id/accounts' => 'users#accounts'
  get '/accounts' => 'users#accounts'

  resources :rooms, only: [ :show, :new]
end
