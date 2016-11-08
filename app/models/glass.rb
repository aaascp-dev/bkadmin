class Glass < Product
    belongs_to :glass_type
    validates_associated :glass_type, { message: "Tipo de copo informado é inválido." }
    validates :glass_type, presence: { message: "Tipo de copo deve ser informado." }
    validates :name, presence: { message: "Nome do copo deve ser informado." }
    validates :name, uniqueness: { message: "Nome informado já existe." }
end
