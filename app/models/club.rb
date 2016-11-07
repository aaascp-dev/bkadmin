class Club < ApplicationRecord
    belongs_to :plan
    has_many :club_products
    has_many :club_extras
    has_many :products, through: :club_products
    validates :plan, presence: true, message: "Deve informar o plano."
    validades_associated :plan, message: "Plano informado é inválido."
    validates :date, presence: true, message: "Deve informar a data."
end
