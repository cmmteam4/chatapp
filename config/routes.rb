Rails.application.routes.draw do
scope "(:locale)", locale: /en|ja/ do
  #scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/do
  get 'thread/index'
  get 'wksinvite/index'
    root 'workspaces#workspace'

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
