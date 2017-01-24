Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    member do
      put "like", to: "posts#upvote"
    end
  end

  root 'posts#index'
  get 'myposts' => 'posts#myposts'
  get 'splash' => 'posts#splash'
end
