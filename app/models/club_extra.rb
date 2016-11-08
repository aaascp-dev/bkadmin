class ClubExtra < ApplicationRecord
    belongs_to :extra, polymorphic: true
    belongs_to :club
    belongs_to :client
    validates :club, presence: true, message: "Deve informar o clube."
    validades :client, presence: true, message: "Deve informar o cliente."
    validates :extra, presence: true, message: "Deve ser informado o extra."
    validates :quantity, presence: true, message: "Deve ser informada a quantidade."
    validates :quantity, numericality: { only_integer: true }, message: "Quantidade deve ser um valor inteiro."
    validates :extra_id, uniqueness: {scope: :[:club_id, :extra_type, :client_id]},
              message: "Extra informado já existe."
end
