class User < ActiveRecord::Base
  has_secure_password
  has_many :groups, dependent: :destroy
  has_many :groups_memberships, through: :memberships, source: :group, dependent: :destroy
  
  # after_create :set_membership
   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i  
   validates :email, :first_name, :last_name,  presence: true 
   validates :email, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX }
   validates :password, confirmation: true, presence: true, on: :create 
   validates :password_confirmation, presence: true, on: :create
  # validate :password,  on: :update, allow_blank: true



end
