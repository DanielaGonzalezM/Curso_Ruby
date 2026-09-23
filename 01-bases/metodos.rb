# Método básico sin parámetros
def saludar
  puts '¡Hola! Bienvenido al curso de Ruby.'
end

saludar # se llama al método

# Método con parámetros
def saludar_con_nombre(nombre)
  puts "Hola, #{nombre}!"
end

saludar_con_nombre('Daniela')

# Método con parámetro por defecto
def saludar_con_saludo(nombre, saludo = 'Hola')
  puts "#{saludo}, #{nombre}!"
end

saludar_con_saludo('Daniela')
saludar_con_saludo('Daniela', 'Buenos días')

# Método que devuelve un valor (return implícito: el último valor evaluado)
def sumar(a, b)
  a + b
end

resultado = sumar(5, 3)
puts "La suma es: #{resultado}"

# Método con return explícito
#
# El símbolo "?" al final del nombre es una convención de Ruby (no un
# requisito del lenguaje): indica a quien lee el código que el método
# devuelve true/false. Ejemplos nativos de Ruby: nil?, empty?, even?, odd?
# También existe la convención "!" para métodos que modifican el objeto
# "in place" o tienen un efecto más "peligroso", como sort! o upcase!.
def es_par?(numero)
  return true if numero.even?

  false
end

puts "¿4 es par? #{es_par?(4)}"
puts "¿7 es par? #{es_par?(7)}"

# Nota: Ruby ya trae un método nativo equivalente: 4.even? / 7.even?
puts "¿4 es par? (nativo) #{4.even?}"

# Ejemplo con "!" (bang): convención para métodos que modifican
# el objeto "in place", en vez de devolver una copia modificada.
frase = 'hola mundo'

frase_mayusculas = frase.upcase    # sin "!": devuelve una copia, no toca "frase"
puts "Original tras upcase (sin !): #{frase}"
puts "Copia en mayúsculas: #{frase_mayusculas}"

frase.upcase!                      # con "!": modifica "frase" directamente
puts "Original tras upcase! (con !): #{frase}"

# Mismo caso con arrays: sort vs sort!
numeros = [3, 1, 4, 1, 5, 9, 2]

numeros_ordenados = numeros.sort   # sin "!": devuelve un array nuevo ordenado
puts "Array original tras sort (sin !): #{numeros}"
puts "Array ordenado (copia): #{numeros_ordenados}"

numeros.sort!                      # con "!": ordena el array original
puts "Array original tras sort! (con !): #{numeros}"
