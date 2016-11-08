class Club < ApplicationRecord
    belongs_to :plan
    has_many :club_products
    has_many :club_extras
    has_many :products, through: :club_products
    validates :plan, presence: { message: "Deve informar o plano." }
    validades_associated :plan, message: "Plano informado é inválido."
    validates :date, presence: { message: "Deve informar a data." }
    validates :plan_id, uniqueness: { scope: :date, message: "Clube informado já existe." }
end
