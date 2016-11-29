class Product < ApplicationRecord
    has_many :club_products, inverse_of: :product
    has_many :club_extras, as: :extra
    has_many :clubs, through: :club_products
    has_many :orders, through: :order_products
    belongs_to :provider
    belongs_to :package
    validates_associated :provider, message: "Fornecedor informado é inválido"
    validates_associated :package, message: "Embalagem informada é inválida"
    validates :name, presence: { message: "Nome deve ser informado." }
    validates :name, uniqueness: { message: "Nome informado já existe." }
    validates :stock, numericality: { only_integer: true, message: "Quantidade em estoque deve ser um numero inteiro." }
    validates :price, numericality: { message: "Preço deve ser um valor numérico." }
end
