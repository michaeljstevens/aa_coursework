Rails.application.routes.draw do
  resources "cats", only:[:index, :show, :create, :update, :destroy, :new, :edit]
  resources "cat_rental_requests", only:[:update, :new, :create, :index, :show, :destroy, :update, :edit]
end
