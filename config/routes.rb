Rails.application.routes.draw do

  resources :employees

  root to: redirect('/session/sign_in')

  resource :session, only: [:new, :create, :destroy],
                     path_names: { new: 'sign_in' }

  resources :clients, param: :dni, only: [:new, :edit, :update, :create] do
    post '/', action: :update, on: :member
    resources :visits, only: [:new, :create]
  end

  resources :visits, only: :show
  resources :turns, only: [:index, :show]

  get 'calendar', to: 'days#index'
end
