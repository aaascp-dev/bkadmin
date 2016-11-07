class Plan < ApplicationRecord
    has_many :subscriptions
    has_many :clubs
    validates :name, presence: true, message: "Nome deve seer informado."
    validates :name, uniqueness: true, message: "Nome informado já existe."
    validates :price, presence: true, message: "Nome deve ser informado."
    validates :price, numericality: true, message: "Preço deve ser um valor numérico."
end
