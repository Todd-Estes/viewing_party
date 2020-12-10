class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: { require: true }

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :parties, dependent: :destroy
  has_many :guests, through: :parties

  has_secure_password

  def invited_to
    Party.joins(:guests).where('guests.user_id = ?', id)
  end

  def all_parties
    parties + invited_to
  end
end
