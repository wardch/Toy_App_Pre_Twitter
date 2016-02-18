class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validate :picture_size

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'Picture must be less then 5 megabytes')
    end
  end
end
