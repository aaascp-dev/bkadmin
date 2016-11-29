class Glass < ApplicationRecord
  has_many :products, as: :is_product
  belongs_to :glass_type
  validates_associated :glass_type, { message: "Tipo de copo informado é inválido." }
  validates :glass_type, presence: { message: "Tipo de copo deve ser informado." }
  validates :name, presence: { message: "Nome do copo deve ser informado." }
  validates :name, uniqueness: { message: "Nome informado já existe." }

  validates :name, presence: { message: "Nome deve ser informado." }
  validates :name, uniqueness: { message: "Nome informado já existe." }
  validates :stock, numericality: { only_integer: true, message: "Quantidade em estoque deve ser um numero inteiro." }
  validates :price, numericality: { message: "Preço deve ser um valor numérico." }
end
