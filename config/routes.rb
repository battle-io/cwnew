Cwnew::Application.routes.draw do

  ## Authentication
  #
    match "/auth/:provider/callback" , :to => "sessions#create"
    match "/auth/failure"            , :to => "sessions#new"
    match "/login" => redirect("/auth/github")
    match "/logout" => "sessions#destroy"

  ## Bots
  #
    resources :bots , :only => [ :create , :new , :show ]

  ## Home
  #
    root :to => "home#index" , :as => :home
    match "/edu", :to => "home#edu", :as => :edu

  ## Likes
  #
    resources :likes , :only => [ :create ]

  ## Users
  #
    resources :users , :only => [ :show ]
    match "/profile" => "users#show" , :as => :profile

end

