class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :people, presence: true, numericality: { greater_than: 0 }
  validate :checkin_before_checkout, on: :create

  private

  def checkin_before_checkout
    if checkin.present? && checkout.present? && checkin > checkout
      errors.add(:checkout, "はチェックインより前の日付にできません。")
      end
    end
    
    def checkin_before_today
      if checkin.present? && checkin < Date.today
        errors.add(:checkin, "は過去の日付にできません。")
      end
    end

    def checkout_before_today
      if checkout.present? && checkout < Date.today
        errors.add(:checkout, "は過去の日付にできません。")
      end
    end
  end