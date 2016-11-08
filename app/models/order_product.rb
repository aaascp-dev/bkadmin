class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product
    validates_associated :order, message: "Compra informada é inválida."
    validates :order, presence: { message: "Compra deve ser informada." }
    validates_associated :product, message: "Produto informado é inválido."
    validates :product, presence: { message: "Produto deve ser informado." }
    validates :quantity, presence: { message: "Quantidade deve ser informada." }
    validates :quantity, numericality: { only_integer: true, message: "Quantidade deve ser um valor inteiro." }
    validates :product_id, uniqueness: { scope: :order_id, message: "Produto informado já existe."}
end
