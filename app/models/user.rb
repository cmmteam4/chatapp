class User < ApplicationRecord
    has_secure_password
    
  has_many :userworkspaces, :dependent => :destroy
  has_many :workspaces, :through => :userworkspaces
  
  has_many :channels, :through => :invites
  has_many :invites, :dependent => :destroy
  
end
