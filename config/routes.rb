Rails.application.routes.draw do
  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :members
    resources :comments
  end


  devise_for :members,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # devise_scope :member do
  #   post 'members/guest_sign_in', to: 'members/sessions#guest_sign_in'

  scope module: :public do
    root to: 'homes#top'
    get "homes/about" => "homes#about"
    resources :tasks do
      resource :favorite, only: [:create, :index, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    get 'members/unsubscribe' => 'members#unsubscribe'
    get 'members/withdraw' => 'members#withdraw'
    delete 'members/withdraw' => 'members#withdraw'
    resources :members, only: [:show, :edit, :update]
  end


end
