Rails.application.routes.draw do
  devise_for :users
  root 'topics#index'
  resources :topics do
  end

end
