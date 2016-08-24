Rails.application.routes.draw do

  resources :questions

  resources :posts

  get 'questions' => 'questions#index'

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
