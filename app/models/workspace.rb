class Workspace < ApplicationRecord
    #has_secure_password
    has_many :userworkspaces, :dependent => :destroy
    has_many :users, :through => :userworkspaces

    has_many :channels, :dependent => :destroy    

    validates :wks_name, presence: true

   
   
end
