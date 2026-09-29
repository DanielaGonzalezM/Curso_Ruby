# Los métodos de instancia son el COMPORTAMIENTO propio de un objeto.
# A diferencia de un Hash (que solo tiene datos), un objeto puede calcular
# cosas usando sus propias variables - ver 01-bases/hashes.rb sección 13.

class Circulo
  attr_reader :radio

  def initialize(radio)
    @radio = radio
  end

  def area
    (Math::PI * radio**2).round(2)
  end

  def perimetro
    (2 * Math::PI * radio).round(2)
  end

  def mayor_que?(otro_circulo) # los métodos que devuelven booleano suelen terminar en ?
    area > otro_circulo.area
  end
end

circulo = Circulo.new(5)
puts circulo.area      # => 78.54
puts circulo.perimetro # => 31.42

circulo_chico = Circulo.new(2)
puts circulo.mayor_que?(circulo_chico) # => true

# un método puede llamar a otro método de la misma instancia sin "self.":
class Rectangulo
  attr_reader :ancho, :alto

  def initialize(ancho, alto)
    @ancho = ancho
    @alto = alto
  end

  def area
    ancho * alto
  end

  def describir
    "Rectángulo de #{ancho}x#{alto}, área = #{area}" # llama a area() internamente
  end
end

puts Rectangulo.new(4, 3).describir # => Rectángulo de 4x3, área = 12
