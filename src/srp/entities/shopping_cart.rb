class ShoppingCart
  @@items = []

  def add_item(cart_item)
    items = cart_item.instance_variables.map { |attribute|
      [attribute[1..-1].to_sym, cart_item.instance_variable_get(attribute)]
    }.to_h
    @@items.push(items)
  end

  def remove_item(index)
    @@items.delete_at(index)
  end

  def items
    @@items
  end

  def total
    @@items.reduce(0) { |sum, num| sum + num[:price] }
  end

  def is_empty
    @@items.empty?
  end

  def clear
    puts "Carrinho de compras foi limpo..."
    @@items.clear()
  end
end
