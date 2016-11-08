class Subscription < ApplicationRecord
    belongs_to :client
    belongs_to :plan
    belongs_to :referral
    validates_associated :client, message: "Cliente informado é inválido."
    validates_associated :plan, message: "Plano informado é inválido."
    validates_associated :referral, message: "Indicação informada é inválida."
    validates :client, presence: true, message: "Cliente deve ser informado."
    validates :plan,  presence: true, message: "Plano deve ser informado."
    validates :start_date, presence: true, message: "Data de início deve ser informada."
    validates :client_id, uniqueness: {scope: [:plan_id, :start_date]},
              message: "Assinatura informada já existe."
end
