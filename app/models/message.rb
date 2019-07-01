class Message < ApplicationRecord
  # after_create { MessageBroadcastJob.perform_now(self) }

  belongs_to :user
  belongs_to :room

  validates :message, presence: true
end
