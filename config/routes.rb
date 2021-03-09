Rails.application.routes.draw do
  get 'password_resets/new'
  devise_for :users
  
  root "homes#index" 
  get 'admin_page', to: 'homes#admin_page'
  get 'author_page', to: 'homes#author_page'
  
  scope '/admin' do
    resources :users
    resources :books
    resources :libraries do
       member do
         post :assigned_book
       end
    end
   post 'unassigned_book', to: 'books#unassigned_book'
  end 
end
