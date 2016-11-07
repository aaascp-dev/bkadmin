class GlassType < ApplicationRecord
    has_many :glasses
    validates :name, presence: true, message: "Deve informar o nome do tipo."
    validates :name, uniqueness: true, message: "Nome informado já existe."
end
