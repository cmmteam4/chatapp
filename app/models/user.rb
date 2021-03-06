class User < ApplicationRecord
    has_secure_password
    
  has_many :userworkspaces, :dependent => :destroy
  has_many :workspaces, :through => :userworkspaces
  
  has_many :channels, :through => :invites
  has_many :invites, :dependent => :destroy
  has_many :messages

  validates :name,  presence: true
  validates :email, presence: true
  validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 6..40}
  validates :password_confirmation, presence: true


end
