Rails.application.routes.draw do
 
  get 'comments/new'
  get 'comments/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :subs, except: [:destroy] do   
    resources :posts, except: [:index, :show]
  end
  resources :posts, only: [:show] do   
    resources :comments, only: [:new, :create]
  end 

end
