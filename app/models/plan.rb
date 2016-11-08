class Plan < ApplicationRecord
    has_many :subscriptions
    has_many :clubs
    validates :name, presence: { message: "Nome deve seer informado." }
    validates :name, uniqueness: { message: "Nome informado já existe." }
    validates :price, presence: { message: "Nome deve ser informado." }
    validates :price, numericality: { message: "Preço deve ser um valor numérico." }
end
