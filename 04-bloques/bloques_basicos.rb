# frozen_string_literal: true

# Un bloque es código que se pasa a un método para que lo ejecute.
# Ya los usamos mucho sin llamarlos "bloques": each, map, select, times...
# todos reciben un bloque { } o do...end.

# 1. Sintaxis: { } para una línea, do...end para varias (ver 01-bases/ciclos.rb sección 9)
[1, 2, 3].each { |n| puts "con llaves: #{n}" }

[1, 2, 3].each do |n|
  puts "con do...end: #{n}"
end

# times también recibe un bloque, igual que each (ver 01-bases/ciclos.rb sección 6)
7.times { |n| puts "times: #{n}" } # el índice empieza en 0, llega hasta 6

# 2. Un método propio puede recibir y ejecutar un bloque con "yield"
def saludar
  puts 'Antes del yield'
  yield # aquí se ejecuta el bloque que le pasen a saludar
  puts 'Despues del yield'
end

saludar { puts '¡Hola desde el bloque!' }

# 3. yield puede usarse varias veces dentro del mismo método
def repetir_tres_veces
  yield
  yield
  yield
end

repetir_tres_veces { puts 'Repitiendo...' }

# 4. el bloque puede usarse para "envolver" comportamiento (antes/después)
def medir_tiempo
  inicio = Time.now
  yield # el código real que queremos medir vive afuera, en el bloque
  fin = Time.now
  puts "Tiempo transcurrido: #{(fin - inicio).round(4)} segundos"
end

medir_tiempo do
  suma = 0
  1000.times { |n| suma += n }
  puts "Suma: #{suma}"
end

# 5. sin bloque, yield revanta un error (ver block_given.rb para manejarlo bien)
# saludar # => LocalJumpError: no block given (yield)
