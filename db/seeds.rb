# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
r = Random.new(123)
b = [true, false]

GlassType.create(name: "Tipo A")
GlassType.create(name: "Tipo B")
GlassType.create(name: "Tipo C")
GlassType.create(name: "Tipo D")

pale_ale = BeerType.create(name: "Pale Ale")
ipa = BeerType.create(name: "India Pale Ale")
witbier = BeerType.create(name: "Witbier")
stout = BeerType.create(name: "Stout")
lager = BeerType.create(name: "Lager")
styles = [pale_ale, ipa, witbier, stout, lager]

provider1 = Provider.create(name: "Fornecedor 1")
provider2 = Provider.create(name: "Fornecedor 2")
provider3 = Provider.create(name: "Fornecedor 3")
provider4 = Provider.create(name: "Fornecedor 4")
providers = [provider1, provider2, provider3, provider4]

bottle = Package.create(name: "Garrafa")
can = Package.create(name: "Lata")
packages = [bottle, can]

volumes = ["300", "500", "600", "1000"]

bitter = BeerCharacteristic.create(name: "Amarga")
sweet = BeerCharacteristic.create(name: "Doce")
strong = BeerCharacteristic.create(name: "Forte")
sour = BeerCharacteristic.create(name: "Ácida")
characteristics = [bitter, sweet, strong, sour]

beers = []
for i in 1..10
  beer = Beer.create(code: i,
                      name: "Cerveja #{i}",
                      beer_type: styles[r.rand(styles.size)],
                      provider: providers[r.rand(providers.size)],
                      price: (1500 + r.rand(1500))/100,
                      cost: (500 + r.rand(1000))/100,
                      stock: 1 + r.rand(200),
                      volume: volumes[r.rand(volumes.size)],
                      package: packages[r.rand(packages.size)],
                      batch_number: "l" + rand(100).to_s,
                      expiration_date: Date.new(2017 + r.rand(5), 1 + r.rand(12), 1 + r.rand(30)),
                      is_imported: b[r.rand(b.size)],
                      is_better_quality: b[r.rand(b.size)])

  beers << beer
end

for i in 1..30
  beer = beers[r.rand(beers.size)]
  characteristic = characteristics[r.rand(characteristics.size)]
  unless beer.beer_characteristics.include? characteristic
    beer.beer_characteristics << characteristic
  end
end
