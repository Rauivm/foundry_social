Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

  root to: redirect("/feed")

  get "feed", to: "feed#index"
  resources :posts, only: :create
  resources :characters, only: %i[index create]
  patch "current_character", to: "characters#switch", as: :switch_character
end
