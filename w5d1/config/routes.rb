Rails.application.routes.draw do
resources :users
resources :goals
resource :session
resources :goal_comments
resources :user_comments
end
