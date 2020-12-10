class Party < ApplicationRecord
  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests

  def convert_time
    start_time&.nil?
    start_time.to_time.strftime('%l:%M %p')
  end

  def convert_date
    day&.nil?
    day.strftime('%-m/%-d/%Y')
  end
end
