class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable

  mount_uploader :file, PhotoUploader
  default_scope -> { order(created_at: desc) }

  validates_integrity_of :file
  validates_processing_of :file
  validate :file_size

  validates :description, presence: true, length: { maximum: 255 }

  private

    def file_size
      errors[:size] = "should be less than 3.0MB" if file.size > 3.0.megabytes
    end 
end
