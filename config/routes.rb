Rails.application.routes.draw do
# ユーザー用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#ユーザー
  root to: 'posts#index'
  get "about" => "users#about"
  get "mypage" => "users#mypage"
  get "users/:id/favorites" => "users#favorites"
  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :genres, only: [:show]

  #管理者
  namespace :admin do
    resources :users
    resources :genres
    resources :posts
  end

end
