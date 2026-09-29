# Herencia: una clase puede heredar atributos y métodos de otra con "<".
# super() llama a la implementación del padre.

class Animal
  attr_reader :nombre

  def initialize(nombre)
    @nombre = nombre
  end

  def hacer_sonido
    'Algún sonido genérico'
  end

  def describir
    "#{nombre} dice: #{hacer_sonido}"
  end
end

class Perro < Animal # Perro hereda de Animal
  def hacer_sonido # sobreescribe (override) el método del padre
    'Guau!'
  end
end

perro = Perro.new('Rex') # usa el initialize heredado de Animal, no hace falta redefinirlo
puts perro.describir # => Rex dice: Guau! (describir también es heredado)

# super sin paréntesis y sin argumentos: pasa TODOS los argumentos recibidos tal cual
# super(args): pasa solo esos argumentos
# super() : no pasa ningún argumento

class Gato < Animal
  def initialize(nombre, color)
    super(nombre) # llama al initialize de Animal para reusar esa lógica
    @color = color
  end

  def hacer_sonido
    'Miau!'
  end

  def describir
    "#{super} (es de color #{@color})" # super también funciona en otros métodos
  end
end

gato = Gato.new('Michi', 'negro')
puts gato.describir # => Michi dice: Miau! (es de color negro)

# jerarquía de más de un nivel
class Cachorro < Perro
  def hacer_sonido
    "#{super} (pero en versión bebé)" # super llama al hacer_sonido de Perro
  end
end

puts Cachorro.new('Toby').describir # => Toby dice: Guau! (pero en versión bebé)

# verificar relaciones de herencia
puts perro.is_a?(Animal)     # => true
puts perro.is_a?(Perro)      # => true
puts Perro.ancestors.inspect # => [Perro, Animal, Object, ...] (cadena de herencia)
