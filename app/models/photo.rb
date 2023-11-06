# == Schema Information
#
# Table name: photos
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  user_id     :bigint           not null
#
class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  # Validaciones
  validates :description, presence: true, length: { minimum: 2 }
  validates :title, presence: true, length: { minimum: 2, maximum: 1000 }
  validates :image, attached: true, content_type: ['image/jpg', 'image/gif', 'image/png', 'image/webp'],
                    size: { less_than: 100.megabytes, message: 'is too large' }
end
