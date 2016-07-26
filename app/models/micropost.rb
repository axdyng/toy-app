class Micropost < ApplicationRecord
  # r/s
  belongs_to :user

  # validation
  validates :content,
            length: { maximum: 30 },
            presence: true
end
