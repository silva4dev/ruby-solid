require_relative "./services/messaging"
require_relative "./entities/order"
require_relative "./services/persistency"
require_relative "./entities/shopping_cart"
require_relative "./entities/product"

shopping_cart = ShoppingCart.new
messaging = Messaging.new
persistency = Persistency.new
order = Order.new(shopping_cart, messaging, persistency)

shopping_cart.add_item(Product.new("Camiseta", 49.91))
shopping_cart.add_item(Product.new("Caderno", 9.9123))
shopping_cart.add_item(Product.new("Lápis", 1.59))

puts shopping_cart.items()
puts shopping_cart.total()
puts order.order_status()
order.checkout()
puts order.order_status()
