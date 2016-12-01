# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'
r = Random.new(123)
bools = [true, false]

volumes = ["300", "500", "600", "1000"]

ExtraType.create(name: "Indicação")
ExtraType.create(name: "Novo Cliente")
ExtraType.create(name: "Campanha Facebook")
ExtraType.create(name: "Copo 3 meses")

provider1 = Provider.create(name: "Fornecedor 1")
provider2 = Provider.create(name: "Fornecedor 2")
provider3 = Provider.create(name: "Fornecedor 3")
provider4 = Provider.create(name: "Fornecedor 4")
providers = [provider1, provider2, provider3, provider4]

glass_type1 = GlassType.create(name: "Tipo A")
glass_type2 = GlassType.create(name: "Tipo B")
glass_type3 = GlassType.create(name: "Tipo C")
glass_type4 = GlassType.create(name: "Tipo D")
glass_types = [glass_type1,glass_type2,glass_type3,glass_type4]

for i in 1..10
  Glass.create(
              name: "Copo #{i}",
              volume: volumes[r.rand(volumes.size)],
              glass_type: glass_types[r.rand(glass_types.size)],
              provider: providers[r.rand(providers.size)],
              price: (1500 + r.rand(1500))/100,
              cost: (500 + r.rand(1000))/100,
              stock: 1 + r.rand(200))
end

pale_ale = BeerType.create(name: "Pale Ale")
ipa = BeerType.create(name: "India Pale Ale")
witbier = BeerType.create(name: "Witbier")
stout = BeerType.create(name: "Stout")
lager = BeerType.create(name: "Lager")
styles = [pale_ale, ipa, witbier, stout, lager]

bottle = Package.create(name: "Garrafa")
can = Package.create(name: "Lata")
packages = [bottle, can]

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
                      is_imported: bools[r.rand(bools.size)],
                      is_better_quality: bools[r.rand(bools.size)])

  beers << beer
end

for i in 1..30
  beer = beers[r.rand(beers.size)]
  characteristic = characteristics[r.rand(characteristics.size)]
  unless beer.beer_characteristics.include? characteristic
    beer.beer_characteristics << characteristic
  end
end
