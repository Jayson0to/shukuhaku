class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  mount_uploader :image, ImageUploader

  has_many :reservations
end
