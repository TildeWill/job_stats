Rails.application.routes.draw do
  resources :positions do
    resource :ratings
  end
  root 'positions#index'

end
