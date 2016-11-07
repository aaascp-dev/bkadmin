class Address < ApplicationRecord
  has_one :client
  validates :zip_code, presence: true, message: "O CEP deve ser informado."
end
