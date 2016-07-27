Rails.application.routes.draw do
  root 'static_pages#home'

  #static pages routes, not connected models
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  #get '/contact', to: 'static_pages#contact'

  # dynamic routes
  get '/signup', to: 'users#new'

  #restful routes (CRUD)
  resources :users, except:[ :new ]
  resources :microposts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
