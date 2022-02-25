Rails.application.routes.draw do
  # 「localhost:3000」でトップページにアクセス
  get '/' => 'home#top'
  get 'about' => 'home#about'

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  # ユーザー
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  get 'users/:id/likes' => 'users#likes'

  # 投稿一覧ページ
  get 'posts/index' => 'posts#index'
  # 新規投稿作成
  get 'posts/new' => 'posts#new'
  # 新規投稿がsubmitされた時のルーティング
  post 'posts/create' => 'posts#create'
  # 編集ページ
  # get 'posts/:id/edit' => 'posts#edit'
  # 編集内容を更新するルーティング
  # post 'posts/:id/update' => 'posts#update'
  # 投稿を削除
  post 'posts/:id/destroy' => 'posts#destroy'

  # 投稿詳細ページ
  # 合致するものを上から探すので index よりも下に書く
  get 'posts/:id' => 'posts#show'

  # いいね！機能
  post 'likes/:post_id/create' => 'likes#create'
  post "likes/:post_id/destroy" => "likes#destroy"

end
