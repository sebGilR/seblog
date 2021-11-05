Rails.application.routes.draw do
  root to: 'admin/articles#index'

  devise_for :users #, defaults: { format: :json }

  scope '/admin' do
    get '/', to: 'admin/articles#index'
    resources :articles, controller: 'admin/articles'
    resources :learning_logs, controller: 'admin/learning_logs'
    resources :learning_log_entries, controller: 'admin/learning_log_entries'
    resources :projects, controller: 'admin/projects'
    resources :project_updates, controller: 'admin/project_updates'
  end

  namespace :api do
    resources :articles,
      :learning_logs,
      :learning_log_entries,
      :projects,
      :project_updates,
      defaults: { format: :json }
  end
end
