Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'

  
  delete '/logout',  to: 'sessions#destroy'
  root 'welcome_page#home'

  
  get 'thread/index'
  get 'wksinvite/index'
    

  get    '/choose_workspace',    to: 'workspaces#workspace' 
  get    '/workspaceList',    to: 'workspaces#wksList'  
  get    '/welcome',    to: 'welcome_page#home'
  get    '/inviteFriend',    to: 'wksinvite#index'
  
  #get    '/login',    to: 'welcome_page#login'
  #get    '/signup',    to: 'welcome_page#signup'
  #get    '/channellist',    to: 'channels#channellist'  
  #get    '/channelsetting',    to: 'channels#channelsetting' 
  #get    '/search',    to: 'workspaces#search' 
 # post   '/search',    to: 'workspaces#search'
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
