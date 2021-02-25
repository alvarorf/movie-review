class Opinion < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 500 }
end
