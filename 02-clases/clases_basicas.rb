# Una clase agrupa DATOS + COMPORTAMIENTO (a diferencia de un Hash,
# que solo guarda datos - ver 01-bases/hashes.rb sección 13 para la comparación).

# 1. Clase básica: initialize y atributos con @variable
class Persona
  def initialize(nombre, edad)
    @nombre = nombre # variable de instancia (empieza con @)
    @edad = edad
  end
end

persona1 = Persona.new('Ana', 30)
p persona1 # => #<Persona:0x... @nombre="Ana", @edad=30>

# sin getters, no se puede leer @nombre desde afuera:
# persona1.nombre # => NoMethodError

# 2. Varias instancias son independientes entre sí
persona2 = Persona.new('Luis', 25)
p persona1 # sigue siendo Ana, 30
p persona2 # Luis, 25 - cada instancia tiene sus propias variables
