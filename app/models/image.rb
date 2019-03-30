class Image < ApplicationRecord
  belongs_to :user
  belongs_to :place

  has_one_attached :picture

  validates :picture, attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg']

  validates :name, presence: true, length: { maximum: 50 }
end
