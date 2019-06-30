Rails.application.routes.draw do
  get 'users/home'

  root 'users#home'

  devise_for :users

  resources :posts, except: [:edit, :update, :destroy] do

    resources :comments, except: [:edit, :update, :destroy]
    
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
