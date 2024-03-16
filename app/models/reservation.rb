class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room

    validates :checkin, presence: true
    validate :checkin_date
    validates :checkout, presence: true
    validate :checkout_date
    validates :count, numericality: { greater_than_or_equal_to: 1, message: "は1人以上にしてください" }

    private

    def checkin_date
        errors.add(:checkin, "は本日以降の日付を入力してください") if checkin.present? && checkin < Date.today
    end

    def checkout_date
        errors.add(:checkout, "はチェックイン日以降の日付を入力してください") if checkout.present? && checkout < checkin
    end
end
