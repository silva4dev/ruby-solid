class ShoppingCartLegacy
  @@items = []
  @@order_status = "open"

  def add_item(item)
    @@items.push(item)
  end

  def remove_item(index)
    @@items.delete_at(index)
  end

  def items
    @@items
  end

  def order_status
    @@order_status
  end

  def total
    @@items.reduce(0) { |sum, num| sum + num[:price] }
  end

  def checkout
    if is_empty()
      puts "Seu carrinho está vazio"
      return
    end
    @@order_status = "closed"
    send_message("Seu pedido com total de #{self.total()} foi recebido.")
    save_order()
  end

  def is_empty
    @@items.empty?
  end

  def send_message(msg)
    puts "Mensagem enviada: " << msg
  end

  def save_order
    puts "Pedido salvo com sucesso..."
  end

  def clear
    puts "Carrinho de compras foi limpo..."
    @@items.clear()
  end
end

shopping_cart = ShoppingCartLegacy.new
shopping_cart.add_item({ name: "Camiseta", price: 49.9 })
shopping_cart.add_item({ name: "Caderno", price: 9.9 })
shopping_cart.add_item({ name: "Lápis", price: 1.59 })

puts shopping_cart.items()
puts shopping_cart.total()
puts shopping_cart.order_status()
shopping_cart.checkout()
puts shopping_cart.order_status()
