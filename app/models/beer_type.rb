class BeerType < ApplicationRecord
    has_many :beers
    has_many :restrictions, as: :beer_restriction
    validates :name, presence: { message: "O nome do tipo deve ser preenchido." }
    validates :name, uniqueness: { message: "Tipo informado já existe." }
end
