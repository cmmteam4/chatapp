Rails.application.routes.draw do
  root   'welcome_page#home'      
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'   
  get    '/choose_workspace',    to: 'workspaces#workspace' 
  get    '/workspaceList',    to: 'workspaces#wksList'  
  get    '/inviteFriend',    to: 'wksinvite#index'
  get    '/edit',   to: 'users#edit'
  get    '/favourite',   to: 'messages#favourite'   

  get "/star",to:"messages#ssss"
  post "/star",to:"messages#star"

  resources :users
  resources :messages

  resources :workspaces do
    resources :wksinvite
  end

  resources :channels do
    resources :invite
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
