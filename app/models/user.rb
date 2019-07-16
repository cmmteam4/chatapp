class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :userworkspaces, :dependent => :destroy
  has_many :workspaces, :through => :userworkspaces
  
  has_many :channels, :through => :invites
  has_many :invites, :dependent => :destroy

end
