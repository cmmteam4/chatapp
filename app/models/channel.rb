class Channel < ApplicationRecord
  has_many :users, :through => :invites
  has_many :invites, :dependent => :destroy

  belongs_to :workspace
  has_many :messages, :dependent => :destroy
end
