# "do" en Ruby aparece en dos contextos distintos:
#   A) como parte de un ciclo/bucle: while...do, until...do, for...do
#   B) como delimitador de un bloque: array.each do |x| ... end
# Ambos se muestran aquí.

# ---------------------------------------------------------------------
# A) Ciclos con "do": while, until, for
# ---------------------------------------------------------------------

# 1. while...do (el "do" es opcional si el while está en una sola línea
#    con salto de línea antes del cuerpo, pero es válido y a veces se ve)
contador = 0
while contador < 5
  puts "while: #{contador}"
  contador += 1
end

# en la práctica casi siempre se omite el do:
contador = 0
while contador < 5
  puts "while (sin do): #{contador}"
  contador += 1
end

# el do SÍ importa cuando el while va en una sola línea: separa la
# condición del cuerpo. RuboCop no lo autocorrige aquí porque es necesario.
contador = 0
contador += 1 while contador < 5 # modificador de línea (ni siquiera lleva "do")
puts "contador tras el while de una línea: #{contador}"

# 2. until...do (opuesto a while: se repite MIENTRAS la condición sea falsa)
contador = 0
until contador >= 5
  puts "until: #{contador}"
  contador += 1
end

# mismo caso: en una sola línea con begin...end, el do ya no aplica,
# se usa como modificador (esto SÍ es lo idiomático para condiciones cortas)
contador = 0
contador += 1 until contador >= 5
puts "contador tras el until de una línea: #{contador}"

# 3. for...do (recorre un rango o colección; NO crea su propio scope,
#    la variable sigue existiendo después del ciclo)
for i in 1..5 do
  puts "for: #{i}"
end
puts "i después del for: #{i}" # => 5 (a diferencia de each, i sigue viva)

# nota: for...in es poco idiomático en Ruby, se prefiere each (ver sección B)

# 4. loop do...end (ciclo infinito, se sale con break)
contador = 0
loop do
  puts "loop: #{contador}"
  contador += 1
  break if contador >= 5
end

# loop { } es exactamente lo mismo, solo con llaves en vez de do...end
# (funciona igual aquí porque el cuerpo es corto; ver sección 9 para la
# convención de cuándo usar { } vs do...end)
contador = 0
loop do
  puts "loop con llaves: #{contador}"
  contador += 1
  break if contador >= 5
end

# ---------------------------------------------------------------------
# B) "do...end" como bloque de un iterador (esto es lo más usado en Ruby)
# ---------------------------------------------------------------------

# 5. each con do...end (equivalente a usar { } para bloques largos)
numeros = [1, 2, 3, 4, 5]

numeros.each do |n|
  puts "each: #{n}"
end

# 6. times (repetir n veces) con do...end
3.times do |i|
  puts "times: #{i}" # empieza en 0
end

# 7. upto y downto
1.upto(5) do |n|
  puts "upto: #{n}"
end

5.downto(1) do |n|
  puts "downto: #{n}"
end

# 8. step (recorrer con un salto distinto de 1)
1.step(10, 2) do |n|
  puts "step: #{n}" # => 1, 3, 5, 7, 9
end

# 9. do...end vs { } - misma función, distinta convención de estilo
# Convención de la comunidad Ruby:
#   { }      para bloques de una sola línea
#   do...end para bloques de varias líneas
cuadrados_una_linea = numeros.map { |n| n**2 }
p cuadrados_una_linea

cuadrados_multilinea = numeros.map do |n|
  cuadrado = n**2
  cuadrado
end
p cuadrados_multilinea

# 10. next y break dentro de un do...end
numeros.each do |n|
  next if n.even? # salta a la siguiente iteración (como "continue")
  break if n > 3 # termina el ciclo por completo

  puts "impar <= 3: #{n}"
end

# 11. each_key y each_value (variantes de each para Hash)
persona = { nombre: 'Luis', edad: 27, ciudad: 'Medellín' }

persona.each_key do |clave|
  puts "clave: #{clave}"
end

persona.each_value do |valor|
  puts "valor: #{valor}"
end

# equivalen a usar each con keys/values, pero sin crear el array intermedio:
persona.keys.each { |clave| puts "clave (con keys.each): #{clave}" }

# 12. each_char (variante de each para String, recorre carácter por carácter)
palabra = 'Ruby'

palabra.each_char do |caracter|
  puts "caracter: #{caracter}"
end

# uso típico: contar o transformar por carácter
vocales = palabra.each_char.count { |c| 'aeiouAEIOU'.include?(c) }
puts "vocales en '#{palabra}': #{vocales}"
