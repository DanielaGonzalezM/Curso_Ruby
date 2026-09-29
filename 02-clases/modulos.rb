# Módulos (module) agrupan métodos y constantes relacionadas.
# Con "include" se pueden "mezclar" (mixin) dentro de una clase,
# compartiendo comportamiento SIN usar herencia.

module Saludable
  def saludar
    "Hola, soy #{nombre}" # asume que quien incluya el módulo tiene un método nombre
  end
end

class Empleado
  include Saludable # "mezcla" los métodos del módulo dentro de la clase
  attr_reader :nombre

  def initialize(nombre)
    @nombre = nombre
  end
end

empleado = Empleado.new('Marta')
puts empleado.saludar # => Hola, soy Marta (método que vino del módulo)

# la ventaja: dos clases sin relación de herencia pueden compartir comportamiento
class Robot
  include Saludable
  attr_reader :nombre

  def initialize(nombre)
    @nombre = nombre
  end
end

puts Robot.new('R2D2').saludar # => Hola, soy R2D2 (Empleado y Robot no comparten herencia)

# un módulo también puede agrupar métodos de utilidad, sin necesidad de instanciar nada
# (module_function o self. dentro del módulo lo hace invocable como Modulo.metodo)
module Matematicas
  def self.cuadrado(n)
    n**2
  end

  def self.cubo(n)
    n**3
  end
end

puts Matematicas.cuadrado(4) # => 16
puts Matematicas.cubo(3)     # => 27

# un módulo también sirve para "namespacing" (agrupar clases relacionadas)
module Tienda
  class Producto
    attr_reader :nombre

    def initialize(nombre)
      @nombre = nombre
    end
  end
end

producto = Tienda::Producto.new('Mouse') # se accede con ::
puts producto.nombre # => Mouse

# varios módulos se pueden incluir en la misma clase:
module Volador
  def volar
    "#{nombre} está volando"
  end
end

class Pajaro
  include Saludable
  include Volador
  attr_reader :nombre

  def initialize(nombre)
    @nombre = nombre
  end
end

tucan = Pajaro.new('Toco')
puts tucan.saludar # => Hola, soy Toco (de Saludable)
puts tucan.volar # => Toco está volando (de Volador)
