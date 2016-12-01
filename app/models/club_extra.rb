class ClubExtra < ApplicationRecord
    belongs_to :extra, polymorphic: true
    belongs_to :extra_type
    belongs_to :club
    belongs_to :client
    validates :extra_type, presence: { message: "Deve informar tipo do extra." }
    validates_associated :extra_type, message: "Tipo do extra informado é inválido"
    validates :club, presence: { message: "Deve informar o clube." }
    validates_associated :club, message: "Clube informado é inválido"
    validades :client, presence: { message: "Deve informar o cliente." }
    validates_associated :client, message: "Cliente informado é inválido"
    validates :extra, presence: { message: "Deve ser informado o extra." }
    validates_associated :extra, message: "Extra informado é inválido"
    validates :quantity, presence: { message: "Deve ser informada a quantidade." }
    validates :quantity, numericality: { only_integer: true, message: "Quantidade deve ser um valor inteiro." }
    validates :extra_id, uniqueness: { scope: :[:club_id, :extra_type, :client_id],
              message: "Extra informado já existe."}

end
