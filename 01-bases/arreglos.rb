# 1. Crear arreglos
numeros = [1, 2, 3, 4, 5]
nombres = %w[Ana Luis Marta]
mixto = [1, 'dos', 3.0, true, nil]
vacio = []

# 2. Acceder a elementos (índice empieza en 0)
puts numeros[0]        # => 1
puts numeros[-1]       # => 5 (último elemento)
puts nombres[1]        # => "Luis"

# 2.1 first y last
puts numeros.first       # => 1 (primer elemento, igual que numeros[0])
puts numeros.last        # => 5 (último elemento, igual que numeros[-1])

puts numeros.first(2).inspect  # => [1, 2] (los primeros 2 elementos)
puts numeros.last(2).inspect   # => [4, 5] (los últimos 2 elementos)

puts vacio.first.inspect  # => nil (no truena si el arreglo está vacío)
puts vacio.last.inspect   # => nil

# 2.2 fetch (acceso "seguro" por índice)
puts numeros.fetch(1)              # => 2, igual que numeros[1]
puts numeros[10].inspect           # => nil (índice fuera de rango, sin error)
puts numeros.fetch(10, 'no existe') # => 'no existe' (valor por defecto)
puts numeros.fetch(10) { |i| "índice #{i} no válido" } # => con bloque

begin
  numeros.fetch(10) # sin default ni bloque -> lanza IndexError
rescue IndexError => e
  puts "Error: #{e.message}"
end

# 2.3 drop y take (subarreglos sin mutar el original)
letras = %w[a b c d e]

puts letras.drop(2).inspect  # => ["c", "d", "e"] (descarta los primeros 2)
puts letras.take(2).inspect  # => ["a", "b"] (toma los primeros 2)

puts letras.inspect          # => ["a", "b", "c", "d", "e"] (original intacto, no muta)

puts letras.drop(0).inspect   # => copia completa del arreglo
puts letras.drop(100).inspect # => [] (si pides más de los que hay, da vacío)

# 3. Agregar elementos
numeros << 6            # push con el operador <<
numeros.push(7)
numeros.unshift(0)      # agrega al inicio
p numeros               # => [0, 1, 2, 3, 4, 5, 6, 7]

# 3.1 += vs << (diferencia importante)
c = [1, 2, 3]
original_id = c.object_id

c += [4, 5] # crea un arreglo NUEVO y lo reasigna a c
puts c.inspect # => [1, 2, 3, 4, 5]
puts c.object_id == original_id # => false (es un objeto distinto)

d = [1, 2, 3]
original_id_d = d.object_id

d << 4 # modifica el arreglo EXISTENTE (in-place)
puts d.inspect # => [1, 2, 3, 4]
puts d.object_id == original_id_d # => true (sigue siendo el mismo objeto)

# 4. Quitar elementos
numeros.pop # quita el último
numeros.shift # quita el primero
p numeros

# 5. Tamaño
puts numeros.length
puts numeros.size
puts numeros.empty? # true/false

# 6. Recorrer un arreglo
nombres.each do |nombre|
  puts "Hola, #{nombre}"
end

# con índice
nombres.each_with_index do |nombre, i|
  puts "#{i}: #{nombre}"
end

# 7. Transformar (map)
dobles = numeros.map { |n| n * 2 }
p dobles

# 8. Filtrar (select / reject)
pares = numeros.select { |n| n.even? }
impares = numeros.reject { |n| n.even? }
p pares
p impares

# 9. Buscar
puts numeros.include?(3)
puts(nombres.find { |n| n.start_with?('L') })

# 10. Ordenar
desordenado = [5, 3, 1, 4, 2]
puts desordenado.sort.inspect         # ascendente
puts desordenado.sort.reverse.inspect # descendente

# 11. Sumar / reducir
total = numeros.sum
puts total
producto = [1, 2, 3, 4].reduce(:*) # multiplica todos
puts producto

# 12. Arreglos anidados (matrices)
matriz = [[1, 2], [3, 4], [5, 6]]
puts matriz[1][0] # => 3

# 13. Unir y dividir strings
palabras = 'Ruby es genial'.split(' ')
p palabras                       # => ["Ruby", "es", "genial"]
puts palabras.join('-')          # => "Ruby-es-genial"

# 14. Eliminar duplicados
repetidos = [1, 2, 2, 3, 3, 3]
puts repetidos.uniq.inspect # => [1, 2, 3]

# 15. Combinar arreglos
a = [1, 2, 3]
b = [4, 5, 6]
puts (a + b).inspect             # concatenar => [1,2,3,4,5,6]
puts (a - [2]).inspect           # diferencia => [1,3]
