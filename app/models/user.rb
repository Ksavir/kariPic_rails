# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :string           not null
#  name                   :string
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relaciones
  has_one_attached :profile_picture
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Validaciones
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :profile_picture, attached: true, content_type: ['image/jpg', 'image/gif', 'image/png', 'image/webp'],
                              size: { less_than: 50.megabytes, message: 'is too large' }

  # Roles
  enum role: { user: 'user', admin: 'admin' }
end
