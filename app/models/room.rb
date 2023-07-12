class Room < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "name","introduction"]
  end
  
  def self.ransackable_associations(auth_object = nil)
  ["name","introduction"]
  end
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reservations
end
