Rails.application.routes.draw do
  devise_for :members
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'homes/top' => 'homes#top'
  get '/homes/about' => 'homes#about'
end
