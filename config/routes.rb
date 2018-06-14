Rails.application.routes.draw do
  get 'open_weather_cities' => 'open_weather_cities#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  resources :users
  resources :user_cities, only: [:index, :show, :destroy, :new]
  post '/user_cities/:open_weather_city_id' => 'user_cities#create'
  root 'user_cities#index'
end
