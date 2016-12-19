Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'top#index'
  get 'top', :controller => 'top', :action => 'index' 

  resources :users do
    resources :topics do
      resources :comments
    end
  end
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
