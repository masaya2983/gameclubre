Rails.application.routes.draw do
  devise_for :adomins,skip: [:registrations, :passwords], controllers:{
   sessions: "adomin/sessions"
  }
  devise_for :users,skip: [:passwords], controllers:{
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  namespace :admin do
   root :to => "homes#top"
   resources :members, only: [:index,:show,:edit,:update]
   resources :games, only: [:index,:show,:edit,:update]
   resources :category, only: [:index,:show,:edit,:update]
 end
 #ゲスト用
 #devise_scope :user do
   # post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
 # end
 scope module: :public do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
   root :to =>"homes#top"
   get "home/about"=>"homes#about"
   resources :users, only: [:index,:show,:edit,:update]
   resource :relationships, only: [:create, :destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
   get "search" => "searches#search"
   resources :games, only: [:index,:create,:show,:update,:destroy,:edit]
   resources :coments, only: [:create,:destroy]
   resources :category, only: [:index,:create,:show,:update]
   resource :favorites, only:[:create,:destroy]
   resources :category, only: [:show]
 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
