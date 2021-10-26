Rails.application.routes.draw do
  resources :learning_log_updates
  resources :learning_logs
  resources :articles
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
