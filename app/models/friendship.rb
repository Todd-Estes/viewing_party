class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, :friend_id, presence: true
  validate :user_is_not_equal_friend
  validates :user_id, uniqueness: { scope: [:friend_id] }

  private

  def user_is_not_equal_friend
    errors.add(:friend, "can't be the same as the user") if user == friend
  end
end
