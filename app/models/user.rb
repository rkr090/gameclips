class User < ActiveRecord::Base
  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :screens

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
