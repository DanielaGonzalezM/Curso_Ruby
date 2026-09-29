# to_s e inspect controlan cómo se representa un objeto como texto.
# Sin definirlos, Ruby usa una representación genérica poco útil.

class ProductoSinFormato
  def initialize(nombre, precio)
    @nombre = nombre
    @precio = precio
  end
end

producto_feo = ProductoSinFormato.new('Mouse', 15.5)
puts producto_feo # => #<ProductoSinFormato:0x0000...> (no dice nada útil)
p producto_feo # => #<ProductoSinFormato:0x0000... @nombre="Mouse", @precio=15.5>

# Definiendo to_s e inspect controlamos ese texto:
class Producto
  attr_accessor :nombre, :precio

  def initialize(nombre, precio)
    @nombre = nombre
    @precio = precio
  end

  def to_s # se usa con puts y en interpolación de strings "#{...}"
    "#{nombre} ($#{precio})"
  end

  def inspect # se usa con p / pp (pensado para debugging)
    "#<Producto nombre=#{nombre.inspect} precio=#{precio}>"
  end
end

producto = Producto.new('Teclado', 45.99)
puts producto  # => Teclado ($45.99)                          (usa to_s)
p producto     # => #<Producto nombre="Teclado" precio=45.99> (usa inspect)
puts "Compraste: #{producto}" # => Compraste: Teclado ($45.99) (usa to_s)

# dentro de un array o hash, p usa inspect de cada elemento:
carrito = [Producto.new('Mouse', 15.5), Producto.new('Teclado', 45.99)]
p carrito
