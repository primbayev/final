class Place < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_one_attached :main_photo
  has_many_attached :pictures


  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
  validates_acceptance_of :terms
end
