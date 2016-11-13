Rails.application.routes.draw do
  root 'topics#index'
  resources :topics do
  end

end
