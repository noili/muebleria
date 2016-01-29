Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy],
                     path_names: { new: 'sign_in' }
end
