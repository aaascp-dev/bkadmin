class Provider < ApplicationRecord
  has_many :products
  validates :name, presence: { message: "Deve informar o nome do fornecedor." }
  validates :name, uniqueness: { message: "Fornecedor informado já existe." }
end
