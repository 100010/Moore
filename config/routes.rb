Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root 'welcome#index'

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :comments
  resources :users, except: [:index] do
    member do
      get :dashboard
    end
  end
end
