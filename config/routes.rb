Cwnew::Application.routes.draw do

  ## Home
  # 
	root :to => "home#index" , :as => :home
	match "/edu", :to => "home#edu", :as => :edu

  ## Authentication
  #
    match "/auth/:provider/callback" , :to => "sessions#create"
    match "/auth/failure"            , :to => "sessions#new"

  ## Users
  #
    resources :users , :only => [ :show ]
    match "/profile" => "users#show"

end

