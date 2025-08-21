class WebProject < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  validates :title, presence: true
  validate  :image_type_and_size

  private

  def image_type_and_size
    return unless image.attached?

    unless image.content_type.in?(%w[image/png image/jpeg image/webp])
      errors.add(:image, "debe ser PNG, JPG o WEBP")
    end

    if image.blob.byte_size > 5.megabytes
      errors.add(:image, "excede 5 MB")
    end
  end
end
