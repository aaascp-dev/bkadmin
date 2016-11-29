class Product < ApplicationRecord
  belongs_to :is_product, polymorphic: true
  validates_associated :is_product, message: "Produto inválido."
  validates :is_product, presence: { message: "Produto deve ser informado." }

  has_many :club_products, inverse_of: :product
  has_many :club_extras, as: :extra
  has_many :clubs, through: :club_products
  has_many :orders, through: :order_products
end
