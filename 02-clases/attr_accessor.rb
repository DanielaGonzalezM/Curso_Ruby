# attr_accessor / attr_reader / attr_writer generan automáticamente los
# métodos getter/setter para leer o escribir variables de instancia,
# sin tener que escribirlos a mano uno por uno.

class Persona
  attr_accessor :nombre # genera getter Y setter (lectura y escritura)
  attr_reader :edad # genera SOLO getter (edad es de solo lectura)

  def initialize(nombre, edad)
    @nombre = nombre
    @edad = edad
  end
end

persona = Persona.new('Luis', 25)

puts persona.nombre # => "Luis" (getter generado automáticamente)
persona.nombre = 'Luis Pérez' # setter generado automáticamente
puts persona.nombre # => "Luis Pérez"

puts persona.edad # => 25 (solo lectura)
# persona.edad = 26 # => NoMethodError, no existe setter para edad

# attr_writer: solo genera el setter, sin getter (menos común)
class Configuracion
  attr_writer :clave_secreta

  def mostrar_si_hay_clave
    @clave_secreta.nil? ? 'sin clave' : 'clave configurada'
  end
end

config = Configuracion.new
puts config.mostrar_si_hay_clave # => sin clave
config.clave_secreta = '1234'    # se puede escribir...
puts config.mostrar_si_hay_clave # => clave configurada
# config.clave_secreta # => NoMethodError, no existe getter para leerla

# equivalente manual de lo que attr_accessor genera por debajo:
class PersonaManual
  def initialize(nombre)
    @nombre = nombre
  end

  attr_accessor :nombre
end

manual = PersonaManual.new('Ana')
puts manual.nombre
manual.nombre = 'Ana María'
puts manual.nombre
