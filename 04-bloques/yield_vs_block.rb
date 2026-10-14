# frozen_string_literal: true

# Dos formas de recibir y ejecutar un bloque en un método:
#   A) yield          -> implícito, no aparece en la lista de parámetros
#   B) &block         -> explícito, se recibe como un Proc con nombre

# A) yield: más simple, usado en el 90% de los casos
def con_yield
  yield(10)
end

puts(con_yield { |n| n * 2 }) # => 20

# B) &block: el bloque se vuelve una variable normal (un Proc)
def con_block(&block)
  block.call(10) # se invoca explícitamente con .call
end

puts(con_block { |n| n * 2 }) # => 20 (mismo resultado que con yield)

# ¿Cuándo usar &block en vez de yield?

# 1. cuando necesitas PASAR el bloque a otro método
def ejecutar_dos_veces(&block)
  [1, 2].each(&block) # reenvía el mismo bloque a each
end

ejecutar_dos_veces { |n| puts "vuelta #{n}" }

# con yield, reenviar el bloque a otro método no es directo:
def ejecutar_dos_veces_con_yield
  2.times { |n| yield(n + 1) } # aquí sí funciona porque yield puede ir dentro de otro bloque
end

ejecutar_dos_veces_con_yield { |n| puts "vuelta #{n}" }

# 2. cuando necesitas GUARDAR el bloque para usarlo después
class Boton
  def initialize(&accion)
    @accion = accion # el bloque queda guardado como un Proc dentro del objeto
  end

  def presionar
    @accion.call # se ejecuta en otro momento, no inmediatamente al crear el Boton
  end
end

boton = Boton.new { puts '¡Click!' }
puts 'El boton fue creado, pero el bloque aun no se ejecuto'
boton.presionar # => ¡Click!

# 3. diferencia de performance: yield es ligeramente más rápido porque
# no convierte el bloque en un objeto Proc (a menos que lo necesites, yield
# suele ser la opción preferida por simplicidad).

# resumen:
#   yield   -> simple y rápido, cuando solo necesitas EJECUTAR el bloque una vez
#   &block  -> cuando necesitas pasar, guardar o reutilizar el bloque como objeto
