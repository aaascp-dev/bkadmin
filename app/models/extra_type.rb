class ExtraType < ApplicationRecord
  has_many :club_extras
  validates :name, presence: { message: "Deve informar o nome do tipo." }
  validates :name, uniqueness: { message: "Tipo informado já existe." }
end
