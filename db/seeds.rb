# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def create_product(name, brand, description, instock)
    Product.create([{
        name: name, 
        brand: brand,
        description: description,
        instock: instock
    }])
end


create_product("Banana", "Chiquita", "Organic", 30)
create_product("Apple Juice", "Martinelli", "Organic, 10 oz. glass jar", 20)
create_product("Vitamin C", "Nature's Way", "500 Mg, 250 capsules", 10)