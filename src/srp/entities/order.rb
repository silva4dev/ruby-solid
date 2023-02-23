class Order
  @@order_status = "open"

  def initialize(shopping_cart, messaging, persistency)
    @cart = shopping_cart
    @messaging = messaging
    @persistency = persistency
  end

  def order_status
    @@order_status
  end

  def checkout
    if @cart.is_empty()
      puts "Seu carrinho está vazio"
      return
    end
    @@order_status = "closed"
    @messaging.send_message("Seu pedido com total de #{@cart.total()} foi recebido.")
    @persistency.save_order()
    @cart.clear()
  end
end
