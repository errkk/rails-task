Rails.application.routes.draw do
  get '/', to: "application#index"
  get 'plan/index'
  get 'plan/subscribe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
