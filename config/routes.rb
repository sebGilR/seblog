Rails.application.routes.draw do
  root to: 'articles#index'
  resources :articles,
    :learning_logs,
    :learning_log_updates,
    :projects,
    :project_updates,
    defaults: { format: :json }

  devise_for :users, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
