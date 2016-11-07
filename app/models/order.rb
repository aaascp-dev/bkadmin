class Order < ApplicationRecord
    belongs_to :client
    has_many :club_extras, as: :extra
    has_many :products, through: :order_products
    validates_associated :client, message: "Cliente informado não é válido."
    validades :client, presence: true, message: "Cliente deve ser informado."
    validates :date, presence: true, message: "Data deve ser informada."
end
