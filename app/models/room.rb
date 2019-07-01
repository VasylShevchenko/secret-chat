class Room < ApplicationRecord

  validates :room_name, presence: true, length: { minimum: 4 }

  belongs_to :user

  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms

  has_many :messages, dependent: :destroy

end
