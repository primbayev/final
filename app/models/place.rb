class Place < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_one_attached :main_photo
  has_many_attached :pictures

  validates :main_photo, attached: true,
            content_type: ['image/png', 'image/jpg', 'image/jpeg']

  validates :pictures, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
  validates_acceptance_of :terms
end
