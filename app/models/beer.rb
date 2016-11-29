class Beer < Product
  belongs_to :beer_type
  has_and_belongs_to_many :beer_characteristics, join_table: "beers_beer_characteristics"
  validates :beer_type, presence: { message: "Deve ser informado um tipo." }
  validates_associated :beer_type, message: "Tipo informado é inválido"
  validates :code, uniqueness: { message: "Código informado já existe." }
  validates :code, numericality: { only_integer: true, message: "Código deve ser um número inteiro." }
  validates :is_imported, inclusion: { in: [true,false], message: "Valor deve ser true ou false." }
  validates :is_better_quality, inclusion: { in: [true,false], message: "Valor deve ser true ou false." }
  validates :volume, numericality: { only_integer: true, message: "Volume deve ser um número inteiro." }

  def self.search(search)
    if search
      find(conditions: ['name LIKE ?', "%#{search}%"], order: "LOWER(name)")
    else
      all()
    end
  end
end
