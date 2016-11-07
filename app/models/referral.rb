class Referral < ApplicationRecord
    belongs_to :inviter, :class_name => 'Client'
    belongs_to :guest, :class_name => 'Client'
    has_one :subscription
    validates_associated :inviter, message: "Convidador é inválido."
    validates_associated :guest, message: "Convidado é inválido."
    validates :inviter, presence: true, message: "Convidador deve ser informado."
    validates :guest, presence: true, message: "Convidado deve ser informado."
    validates :date, presence: true, message: "Data deve ser informada."
end
