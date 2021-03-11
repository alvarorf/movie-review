class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :user_id, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 500 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :newsfeed_opinions, -> { includes(:author).ordered_by_most_recent }
end
