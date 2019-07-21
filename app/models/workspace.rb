class Workspace < ApplicationRecord
    has_many :userworkspaces, :dependent => :destroy
    has_many :users, :through => :userworkspaces

    has_many :channels, :dependent => :destroy
    paginates_per 3

    validates :wks_name, presence: true
    #validates :email, {presence: true,length:{maximunm:100}
end
