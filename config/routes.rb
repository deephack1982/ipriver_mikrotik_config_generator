Rails.application.routes.draw do
  resources :configs
  resources :config_templates
  resources :interfaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
