class BeerType < ApplicationRecord
    has_many :beers
    has_many :restrictions, as: :beer_restriction
    validates :name, presence: true, message: "O nome do tipo deve ser preenchido."
    validates :name, uniqueness: true, message: "Tipo informado já existe."
end
