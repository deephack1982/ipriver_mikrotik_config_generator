json.extract! config_template, :id, :name, :description, :config_text, :created_at, :updated_at
json.url config_template_url(config_template, format: :json)