Rails.application.routes.draw do
  get 'books/create'

  get 'books/show'

  get 'books/edit'

  get 'books/update'

  get 'books/destroy'

  get 'users/index'

  get 'users/show'

  devise_for :users, controllers: { :omniauth_callbacks => "oauth_callbacks" }
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :users, only: [:index, :show]
  resources :books, only: [:create, :destroy, :edit, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
