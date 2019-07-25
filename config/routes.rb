Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
  root   'welcome_page#home'  
  get    '/signup',   to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'  
  delete '/logout',  to: 'sessions#destroy'
  root 'welcome_page#home'    
  get 'thread/index'   

  get    '/choose_workspace',    to: 'workspaces#workspace' 
  get    '/workspaceList',    to: 'workspaces#wksList'  
  get    '/welcome',    to: 'welcome_page#home'
  get    '/inviteFriend',    to: 'wksinvite#index'
  get    '/edit',    to: 'users#edit'
  #get    '/home',    to: 'welcome_page#home'
  
  #get    '/login',    to: 'welcome_page#login'
  #get    '/signup',    to: 'welcome_page#signup'  
  #get "/channel/:cid/:wid",to:"channels#cshow" 
  
  resources :users
  resources :messages
  
  resources :workspaces do
    resources :wksinvite
  end

  resources :channels do
    resources :invite
  end 
 end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
