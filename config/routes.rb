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

  scope module: :public do
    root to: 'homes#top'
    get "homes/about" => "homes#about"
    resources :tasks
    resources :favorites, only: [:create, :index, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :members, only: [:show, :edit, :update]
    get 'members/unsubscribe' => 'members#unsubscribe'
    get 'members/withdraw' => 'members#withdraw'
  end

  # root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'homes/top' => 'homes#top'
  # get '/homes/about' => 'homes#about'
end
