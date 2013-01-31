class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # sanitize_for_mass_assignment :name, :email, :password, :password_confirmation, :remember_me

  has_many :balances
end
