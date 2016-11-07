class ClubProduct < ApplicationRecord
    belongs_to :club
    belongs_to :product
    validates :club, presence: true, message: "Deve informar o clube."
    validates_associated :club, message: "Clube informado é inválido."
    validates :product, presence: true, message: "Deve informar o produto."
    validates_associated :product, message: "Produto informado é inválido."
    validates :quantity, presence: true, message: "Deve informar a quantidade."
    validates :quantity, numericality: { only_integer: true }
end
