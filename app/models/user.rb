class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  # Makes user name a required field with a min and max character lengths of
  # 4 and 16 respectively.

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  # This identifies that each user has a ONE TO MANY relationship with posts.
  # The dependent: :destroy part means all associated objects will be destroyed,
  # e.g. any content associated with that post such as the image or the caption.
end
