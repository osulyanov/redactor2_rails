Redactor2Rails::Engine.routes.draw do
  resources :images, only: :create
  resources :files, only: :create
end
