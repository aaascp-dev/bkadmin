class Beer < ApplicationRecord
  has_many :products, as: :is_product
  belongs_to :beer_type
  has_and_belongs_to_many :beer_characteristics, join_table: "beers_beer_characteristics"
  validates :beer_type, presence: { message: "Deve ser informado um tipo." }
  validates_associated :beer_type, message: "Tipo informado é inválido"
  validates :code, uniqueness: { message: "Código informado já existe." }
  validates :code, numericality: { only_integer: true, message: "Código deve ser um número inteiro." }
  validates :is_imported, inclusion: { in: [true,false], message: "Valor deve ser true ou false." }
  validates :is_better_quality, inclusion: { in: [true,false], message: "Valor deve ser true ou false." }
  validates :volume, numericality: { only_integer: true, message: "Volume deve ser um número inteiro." }
  validate  :valid_date

  belongs_to :provider
  belongs_to :package
  validates_associated :provider, message: "Fornecedor informado é inválido"
  validates_associated :package, message: "Embalagem informada é inválida"
  validates :name, presence: { message: "Nome deve ser informado." }
  validates :name, uniqueness: { message: "Nome informado já existe." }
  validates :stock, numericality: { only_integer: true, message: "Quantidade em estoque deve ser um numero inteiro." }
  validates :price, numericality: { message: "Preço deve ser um valor numérico." }

  private
    def valid_date
      errors.add(:expiration_date, "Data de validade inválida.") if expiration_date.nil?
    end

    def self.search(search)
      if search
        order("LOWER(name)").where("name LIKE ?", "%#{search}%")
      else
        order("LOWER(name)").all
      end
    end
end
