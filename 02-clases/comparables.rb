# Comparación de objetos: == (igualdad) y <=> ("nave espacial", ordenamiento).
# El módulo Comparable da <, >, <=, >=, between?, clamp... con solo definir <=>.

class Punto
  include Comparable # da <, >, <=, >=, between?... con solo definir <=>

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def magnitud
    Math.sqrt((x**2) + (y**2))
  end

  def ==(other) # cómo se comparan dos puntos con ==
    other.is_a?(Punto) && x == other.x && y == other.y
  end

  def <=>(other) # comparación de orden: -1, 0 o 1 (necesario para Comparable)
    magnitud <=> other.magnitud
  end

  def to_s
    "(#{x}, #{y})"
  end
end

p1 = Punto.new(3, 4) # magnitud 5.0
p2 = Punto.new(3, 4)
p3 = Punto.new(1, 1) # magnitud ~1.41

puts p1 == p2 # => true (mismas coordenadas, usa nuestro ==)
puts p1.equal?(p2) # => false (no son el MISMO objeto en memoria, aunque sean "iguales")

puts p1 > p3  # => true  (Comparable usa el <=> que definimos, compara magnitudes)
puts p1 < p3  # => false
puts p1 == p3 # => false

# métodos que Comparable "regala" con solo definir <=>:
puts p1.between?(p3, Punto.new(10, 10)) # => true
puts [p1, p3, p2].sort.map(&:to_s).inspect # => ["(1, 1)", "(3, 4)", "(3, 4)"]
puts [p1, p3].min # => (1, 1)
puts [p1, p3].max # => (3, 4)

# sin <=>, sort/min/max no sabrían cómo ordenar objetos personalizados:
class SinComparable
  def initialize(valor)
    @valor = valor
  end
end

# [SinComparable.new(1), SinComparable.new(2)].sort # => ArgumentError: comparison failed
