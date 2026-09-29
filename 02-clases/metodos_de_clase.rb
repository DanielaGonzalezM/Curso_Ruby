# Métodos y variables de CLASE (a diferencia de instancia):
#   self.metodo   -> pertenece a la clase, no a un objeto en particular
#   @@variable    -> compartida por TODAS las instancias
#   CONSTANTE     -> valor fijo, se accede con ::

class Contador
  @@total = 0    # variable de clase: una sola copia, compartida por todas las instancias
  LIMITE = 100   # constante de clase

  def initialize
    @@total += 1 # cada vez que se crea una instancia, se incrementa la variable compartida
  end

  def self.total # método de clase (se llama Contador.total, NO en una instancia)
    @@total
  end

  def self.reiniciar
    @@total = 0
  end
end

Contador.new
Contador.new
Contador.new
puts Contador.total # => 3 (cuenta todas las instancias creadas)
puts Contador::LIMITE # => 100 (constantes se acceden con ::)

Contador.reiniciar
puts Contador.total # => 0

# diferencia clave: @variable es por instancia, @@variable es compartida
class Ejemplo
  @@compartida = 0

  def initialize
    @propia = 0
  end

  def incrementar
    @propia += 1 # solo afecta a ESTE objeto
    @@compartida += 1 # afecta a TODOS los objetos de esta clase
  end

  attr_reader :propia

  def self.compartida
    @@compartida
  end
end

e1 = Ejemplo.new
e2 = Ejemplo.new
e1.incrementar
e1.incrementar
e2.incrementar

puts e1.propia          # => 2 (solo contó las veces que e1 incrementó)
puts e2.propia          # => 1 (solo contó las veces que e2 incrementó)
puts Ejemplo.compartida # => 3 (la suma de TODAS las instancias)

# otra forma común de definir varios métodos de clase: class << self
class Utilidades
  class << self
    def saludar
      'Hola desde un método de clase'
    end

    def despedir
      'Adiós desde un método de clase'
    end
  end
end

puts Utilidades.saludar
puts Utilidades.despedir
