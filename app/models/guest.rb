class Guest < ApplicationRecord
  belongs_to :party
  has_many :users, dependent: :destroy
end
