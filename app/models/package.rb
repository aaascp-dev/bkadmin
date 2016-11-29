class Package < ApplicationRecord
  has_many :products
  validates :name, presence: { message: "Deve informar o nome da embalagem." }
  validates :name, uniqueness: { message: "Embalagem informado já existe." }
end
