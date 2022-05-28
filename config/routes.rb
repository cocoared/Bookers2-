Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#follows", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end


  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    # resourceは「それ自身のidがわからなくても、関連する他のモデルのidから、特定することができる」場合に使用することが多い。
  end
end
