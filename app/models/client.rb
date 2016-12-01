class Client < ApplicationRecord
    has_one :address
    accepts_nested_attributes_for :address
    has_many :inviters, class_name:'Referral', foreign_key: :inviter_id
    has_many :guests, class_name: 'Referral', foreign_key: :guest_id
    has_many :subscriptions
    has_many :orders
    has_many :club_extras
    has_and_belongs_to_many :restrictions
    validates :address, presence: { message: "Deve ser informado um endereço." }
    validates_associated :address, { message: "Enereço informado é inválido" }
    validates :full_name, uniqueness: { message: "Nome informado já existe." }
    validates :full_name, presence: { message: "Deve ser informado um nome." }
    validates :email, presence: { message: "Deve ser informado um email." }
    validates :email, uniqueness: { message: "Email informado já existe." }
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create,
              message: "Email informado é inválido." }
    validates :document_number, uniqueness: { message: "CPF informado já existe." }
    validates :document_number, presence: { message: "CPF deve ser informado." }
    validates :document_number, numericality: { only_integer: true, message: "CPF deve ser apenas números." }


end
