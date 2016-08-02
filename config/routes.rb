Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :create, :destroy] do
    resources :contacts, :comments, only: [:index]
    get 'authored_comments/' => 'comments#author_index'
  end
  # get 'users/' => 'users#index'
  # get 'users/:id' => 'users#show'
  # post 'users/' => 'users#create'
  # patch 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
  # put 'users/:id' => 'users#update'
  # get 'users/new' => 'users#new'
  # get 'users/:id/edit' => 'users#edit'
  resources :contacts, only: [:show, :update, :create, :destroy] do
    resources :comments, only: [:index]
  end
  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :update]
end
