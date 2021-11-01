Rails.application.routes.draw do
  root to: 'admin/articles#index'

  devise_for :users #, defaults: { format: :json }

  namespace :api do
    resources :articles,
      :learning_logs,
      :learning_log_entries,
      :projects,
      :project_updates,
      defaults: { format: :json }
  end
end
