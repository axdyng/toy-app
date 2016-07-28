class Micropost < ApplicationRecord
  # r/s
  belongs_to :user
  # set default order by latest post
  default_scope -> { order(created_at: :desc) }

  # validation
  validates :content,
            length: { maximum: 140 },
            presence: true

  validates :user_id,
            presence: true
end
