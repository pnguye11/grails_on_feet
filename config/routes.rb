Rails.application.routes.draw do

  root 'posts#splash'

  devise_for :users

  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
  end

  get 'myposts' => 'posts#myposts'
  get 'index' => 'posts#index'
end
