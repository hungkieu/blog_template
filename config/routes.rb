Rails.application.routes.draw do
  root 'welcome#home'
  get 'admin/index'
  get 'welcome/search'
  post "posts/:id/comments", to: "posts#comments", as: :comments

  resources :posts
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
