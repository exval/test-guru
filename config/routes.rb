Rails.application.routes.draw do

  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :about do
  	resources :author
  end

  # resources :author, path: '/about/author'
  # match '/about/author' => 'author#index', via: [:get, :post]
  # get 'about/author' => 'about#author'
  get 'about/author' => 'author#index'
  root 'about#index'
end
