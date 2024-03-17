class Room < ApplicationRecord
    has_many :reservations
    belongs_to :user

    has_one_attached :image
    mount_uploader :image , ImageUploader

    def self.search(query)
        where("address LIKE ? OR introduce LIKE ?", "%#{query}%", "%#{query}%")
    end

    validates :price, numericality: { greater_than_or_equal_to: 1, message: "は1円以上にしてください" }
    validates :roomname, presence: true
    validates :introduce, presence: true
    validates :address, presence: true

end
