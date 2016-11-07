class Restriction < ApplicationRecord
    belongs_to :beer_restriction, polymorphic: true
    has_and_belongs_to_many :clients
    validates_associated :beer_restriction, message: "Restrinção é inválida."
    validates :beer_restriction, presence: true, message: "Restrição deve ser informada"
end
