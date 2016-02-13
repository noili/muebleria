Rails.application.routes.draw do

  resources :employees

  root to: redirect('/session/sign_in')

  resource :session, only: [:new, :create, :destroy],
                     path_names: { new: 'sign_in' }

  resources :clients, param: :dni, only: [:edit, :create, :update, :new] do
    resources :visits, only: [:new, :create]
  end

  resources :visits, only: :show
  resources :turns, only: [:create, :update, :edit, :show, :destroy]

  get 'calendar', to: 'days#index'
end
