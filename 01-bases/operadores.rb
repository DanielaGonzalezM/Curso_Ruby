# Operadores de comparación (devuelven true/false)
a = 10
b = 3

puts "#{a} == #{b} -> #{a == b}"   # igual a
puts "#{a} != #{b} -> #{a != b}"   # distinto de
puts "#{a} > #{b}  -> #{a > b}"    # mayor que
puts "#{a} < #{b}  -> #{a < b}"    # menor que
puts "#{a} >= #{b} -> #{a >= b}"   # mayor o igual
puts "#{a} <= #{b} -> #{a <= b}"   # menor o igual

# Operador de comparación combinada (spaceship): devuelve -1, 0 o 1
puts "#{a} <=> #{b} -> #{a <=> b}" # 1 porque a es mayor
puts "#{b} <=> #{a} -> #{b <=> a}" # -1 porque b es menor
puts "#{a} <=> #{a} -> #{a <=> a}" # 0 porque son iguales

# Operadores lógicos
llueve = true
tengo_paraguas = false

puts "llueve && tengo_paraguas -> #{llueve && tengo_paraguas}" # AND: true solo si ambos son true
puts "llueve || tengo_paraguas -> #{llueve || tengo_paraguas}" # OR: true si al menos uno es true
puts "!llueve -> #{!llueve}" # NOT: invierte el valor

# También existen las versiones en palabra: and, or, not
# (tienen menor precedencia, se usan menos en expresiones normales)
puts "llueve and tengo_paraguas -> #{llueve and tengo_paraguas}"

# Operadores de rango
rango = (1..5) # inclusivo: incluye el 5
rango_exclusivo = (1...5) # exclusivo: NO incluye el 5

puts "Rango 1..5: #{rango.to_a}"
puts "Rango 1...5: #{rango_exclusivo.to_a}"

# Operador ternario: condición ? valor_si_true : valor_si_false
edad = 20
resultado = edad >= 18 ? 'mayor de edad' : 'menor de edad'
puts "Resultado ternario: #{resultado}"

# Operador de asignación condicional (||=)
# Asigna un valor solo si la variable es nil o false
nombre = nil
nombre ||= 'invitado'
puts "Nombre tras ||=: #{nombre}"

nombre ||= 'otro valor' # no cambia porque nombre ya tiene valor
puts "Nombre tras segundo ||=: #{nombre}"

# Operadores de asignación abreviados
# Son un atajo: "variable OP= valor" equivale a "variable = variable OP valor"
contador = 5

contador += 1   # contador = contador + 1
puts "Contador tras += 1: #{contador}"

contador -= 2   # contador = contador - 2
puts "Contador tras -= 2: #{contador}"

contador *= 3   # contador = contador * 3
puts "Contador tras *= 3: #{contador}"

contador /= 2   # contador = contador / 2
puts "Contador tras /= 2: #{contador}"

contador **= 2  # contador = contador ** 2
puts "Contador tras **= 2: #{contador}"

contador %= 5   # contador = contador % 5
puts "Contador tras %= 5: #{contador}"
