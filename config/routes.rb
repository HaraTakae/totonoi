Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,controllers: {
  sessions: "public/sessions",
  registrations: 'public/registrations',
}

  scope module: :public do
    root to: 'homes#top'
    patch 'users/withdrawal' => "users#withdrawal"
    get 'users/confirm_withdrawal' => "users#confirm_withdrawal"
    resources :users, only: [:show, :edit, :update]
    resources :facility_posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :areas, only: [:show]
  end
  
  namespace :admin do
    get "" => "homes#top"
    resources :areas, only: [:index, :create, :edit, :update]
    resources :comments, only: [:index, :show, :edit, :update]
    resources :facility_posts, only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
