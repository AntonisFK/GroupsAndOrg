class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships 
  has_many :users_memberships, through: :memberships, source: :user 

  validates :description, :name,  presence: true
  validates :name, length: {minimum: 5}
  validates :description, length: {minimum: 10}

  
end
