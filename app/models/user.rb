class User < ApplicationRecord
  attr_accessor :reset_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Trackable

  before_validation :user_name_downcase_and_copy_to_user_name_view, on: [:create, :update]

  validates :email,
            presence: true,
            uniqueness: true
  validates :user_name,
            presence: true,
            length: { minimum: 4 },
            uniqueness: true
  validates :user_name_view,
            presence: true

  has_one :auth_token, dependent: :destroy

  after_create :create_auth_token


  def user_token
    auth_token.token if defined?(auth_token)
  end

  private

  # Before validation user_name
  def user_name_downcase_and_copy_to_user_name_view
    user_name_valid = user_name.downcase.delete(" \t\r\n")
    user_name_view_valid = user_name_view.downcase.delete(" \t\r\n")

    if user_name_view != user_name && user_name_view_valid != user_name
      self.user_name_view = user_name.delete(" \t\r\n")
      self.user_name      = user_name_valid
    end
  end

end
