class Place < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
end
