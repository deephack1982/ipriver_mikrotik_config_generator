Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :configs do
    member do
      get 'generate'
    end
  end
  resources :config_templates
  resources :interfaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
