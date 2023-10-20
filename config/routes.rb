Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,controllers: {
  sessions: "public/sessions",
  registrations: 'public/registrations',
}

  # ゲスト
  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  scope module: :public do
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update]
    resources :facility_posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :update, :destroy]
    end
    resources :areas, only: [:show]
  end
  
  namespace :admin do
    get "" => "homes#top"
    resources :areas, only: [:index, :create, :edit, :update]
    resources :comments, only: [:index, :show, :edit, :update, :destroy]
    resources :facility_posts, only: [:index, :show, :edit, :update, :destroy] do
      resources :comments, only: [:index, :show, :edit, :update, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  get "/search", to: "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
