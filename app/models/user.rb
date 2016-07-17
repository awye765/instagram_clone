class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  # Makes user name a required field with a min and max character lengths of
  # 4 and 16 respectively.

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
