class Beer < Product
    belongs_to :beer_type
    has_and_belongs_to_many :beer_characteristics
    validates :beer_type, presence: true, message: "Deve ser informado um tipo."
    validates_associated :beer_type, message: "Tipo informado é inválido"
    validates :code, uniqueness: true, message: "Código informado já existe."
    validates :code, numericality: { only_integer: true }, message: "Código deve ser um número inteiro."
    validates :is_imported, inclusion: { in: [true,false] }, message: "Valor deve ser true ou false."
    validates :is_better_quality, inclusion: { in: [true,false] }, message: "Valor deve ser true ou false."
end
