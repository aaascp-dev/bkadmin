class ClubProduct < ApplicationRecord
    belongs_to :club
    belongs_to :product
    validates :club, presence: { message: "Deve informar o clube." }
    validates_associated :club, message: "Clube informado é inválido."
    validates :product, presence: { message: "Deve informar o produto." }
    validates_associated :product, message: "Produto informado é inválido."
    validates :quantity, presence: { message: "Deve informar a quantidade." }
    validates :quantity, numericality: { only_integer: true, message: "Quanditade deve ser um valor inteiro." }
    validates :product_id, uniqueness: { scope: :club_id, message: "Produto informado já existe." }
end
