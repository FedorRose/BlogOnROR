Rails.application.routes.draw do

  devise_for :users
root 'posts#index', as: 'home'

get 'about' => 'pages#about', as: 'about'
get ':cat_slug' => 'posts#cats', as: 'cats'
get ':cat_slug/:post_slug' => 'posts#show', as: 'show'
get 'add/new/post' => 'posts#new', as: 'add'

resources :posts do
  resources :comments
end

end
