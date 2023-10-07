Rails.application.routes.draw do
  namespace :public do
    get 'comments/show'
    get 'comments/index'
    get 'comments/edit'
    get 'comments/new'
  end
  namespace :admin do
    get 'comments/show'
    get 'comments/index'
    get 'comments/edit'
  end
  namespace :public do
    get 'areas/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/confirm_withdrawal'
    get 'users/new'
  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :users,controllers: {
  sessions: "public/sessions",
  registrations: 'public/registrations',
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
