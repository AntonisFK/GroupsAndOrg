class Group < ActiveRecord::Base
  belongs_to :user
  has_many :memberships , dependent: :destroy
  has_many :users_memberships, through: :memberships, source: :user , dependent: :destroy

  validates :description, :name,  presence: true
  validates :name, length: {minimum: 5}
  validates :description, length: {minimum: 10}

  
end
