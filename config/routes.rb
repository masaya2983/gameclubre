Rails.application.routes.draw do
  devise_for :adomins,skip: [:registrations, :passwords], contorollers:{
   sessions: "adomin/sessions"
  }
  devise_for :users,skip: [:passwords], contorollers:{
    registrstions: "publick/ registrstions",
    sessions: 'publick/sessions'
  }
  namespace :admin do
   root :to => "homes#top"
   resources :members, only: [:index,:show,:edit,:update]
   resources :games, only: [:index,:show,:edit,:update]
   resources :category, only: [:index,:show,:edit,:update]
 end
 #ゲスト用
 devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
 scope module: :public do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
   root :to =>"homes#top"
   get "about" => "homes#top"
   resources :user, only: [:index,:show,:edit,:update]
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
   resources :games, only: [:index,:create,:show,:update,:destroy]
   resources :coments, only: [:create,:destroy]
   resources :category, only: [:index,:create,:show,:update]
   resource :favorites, only:[:create,:destroy]
   resources :genres, only: [:show]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
