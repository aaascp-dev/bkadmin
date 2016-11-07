class Glass < Product
    belongs_to :glass_type
    validates_associated :glass_type, message: "Tipo de copo informado é inválido."
    validates :glass_type, presence: true, message: "Tipo de copo deve ser informado."
    validates :name, presence: true, message: "Nome do copo deve ser informado."
    validates :name, uniqueness: true, message: "Nome informado já existe."
end
