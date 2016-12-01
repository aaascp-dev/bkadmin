class Address < ApplicationRecord
  belongs_to :client
  validates :zip_code, presence: { message: "O CEP deve ser informado." }
  validates :client, presence: { message: "Client deve ser informado um tipo." }
  validates_associated :client, message: "Cliente informado é inválido."
end
