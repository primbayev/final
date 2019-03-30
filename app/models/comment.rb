class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :body, presence: true, length: { maximum: 150 }
  validates_uniqueness_of :user_id, scope: [:place_id]
end
