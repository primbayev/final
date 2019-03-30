class Place < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_one_attached :main_photo
  has_many_attached :pictures

  validates :main_photo,
            content_type: ['image/png', 'image/jpg', 'image/jpeg']

  validates :pictures, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 150 }
  validates_acceptance_of :terms

  def overall
    if self.comments.present?

      sum_food_quality = 0

      self.comments.each do |comment|
        sum_food_quality += comment.food_quality.to_f
      end

      average_food_quality = sum_food_quality/self.comments.count

      sum_service_quality = 0

      self.comments.each do |comment|
        sum_service_quality += comment.service_quality.to_f
      end

      average_service_quality = sum_service_quality/self.comments.count

      sum_interior = 0

      self.comments.each do |comment|
        sum_interior += comment.interior.to_f
      end

      average_interior_quality = sum_interior/self.comments.count

      ((average_food_quality + average_interior_quality + average_service_quality)/3).round(1)
    else
      0
    end
  end

end
