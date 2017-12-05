Rails.application.routes.draw do
  resources :skills
  resources :flexhelpers
  resources :subscriptions
  resources :qualifications
  resources :tags
  resources :projects
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'projects/:id/like', to: "projects#like"
  post 'projects/:id/comment', to: "projects#comment"
  post 'register', to: "registrations#create"
  post 'login', to: "sessions#create"

  get 'account', to: "accounts#show"
  # get 'findaccount', to: "accounts#find"

  get 'channel/:channel', to: "channel#show"
  get 'channel/:channel/subscription', to: "channel#subscription"
end
