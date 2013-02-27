ProjectManager::Application.routes.draw do

  resources :users do
    collection do
      get :showallusers
    end
  end

  resources :projects do
    resources :issues  
  end

  #resources :issues

  resources :projects

  resources :sessions


  root :to => "users#index"

  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout

end