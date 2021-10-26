json.extract! learning_log, :id, :title, :description, :article, :created_at, :updated_at
json.url learning_log_url(learning_log, format: :json)
