Rails.application.routes.draw do
  root 'static_pages#home'

  #restful routes (CRUD)
  resources :users
  resources :microposts

  #static pages routes, no models
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
