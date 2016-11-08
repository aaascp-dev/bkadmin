class GlassType < ApplicationRecord
    has_many :glasses
    validates :name, presence: { message: "Deve informar o nome do tipo." }
    validates :name, uniqueness: { message: "Nome informado já existe." }
end
