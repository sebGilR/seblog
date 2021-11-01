json.extract! project_update, :id, :description, :project_id, :created_at, :updated_at
json.url project_update_url(project_update, format: :json)
