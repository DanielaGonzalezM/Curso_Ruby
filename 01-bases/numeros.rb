# Operadores matemáticos básicos
a = 10
b = 3

suma = a + b
resta = a - b
multiplicacion = a * b
division = a / b               # división entera si ambos son Integer
division_flotante = a / b.to_f # división con decimales
modulo = a % b                 # resto de la división
potencia = a**b # a elevado a b

puts "Suma: #{a} + #{b} = #{suma}"
puts "Resta: #{a} - #{b} = #{resta}"
puts "Multiplicación: #{a} * #{b} = #{multiplicacion}"
puts "División entera: #{a} / #{b} = #{division}"
puts "División flotante: #{a} / #{b} = #{division_flotante}"
puts "Módulo: #{a} % #{b} = #{modulo}"
puts "Potencia: #{a} ** #{b} = #{potencia}"

# Operadores de asignación abreviados
contador = 5
contador += 1   # equivale a contador = contador + 1
puts "Contador tras += 1: #{contador}"

contador -= 2   # equivale a contador = contador - 2
puts "Contador tras -= 2: #{contador}"

contador *= 3   # equivale a contador = contador * 3
puts "Contador tras *= 3: #{contador}"

contador /= 2   # equivale a contador = contador / 2
puts "Contador tras /= 2: #{contador}"

# Operadores de comparación (devuelven true/false)
puts "#{a} > #{b} -> #{a > b}"
puts "#{a} < #{b} -> #{a < b}"
puts "#{a} == #{b} -> #{a == b}"
puts "#{a} != #{b} -> #{a != b}"
