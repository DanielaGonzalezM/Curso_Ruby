# frozen_string_literal: true

# yield puede enviar valores al bloque, que el bloque recibe entre | |
# (igual que |n| en each, o |clave, valor| en each de un Hash).

# 1. yield con un argumento
def saludar_a(nombre)
  yield(nombre) # le pasa "nombre" al bloque
end

saludar_a('Ana') { |n| puts "Hola, #{n}!" }

# 2. yield con varios argumentos
def mostrar_coordenadas
  yield(3, 4)
end

mostrar_coordenadas { |x, y| puts "x=#{x}, y=#{y}" }

# 3. el método puede usar lo que el bloque devuelve
def transformar(valor)
  resultado = yield(valor) # el bloque devuelve algo, y el método lo recibe aquí
  puts "Resultado: #{resultado}"
end

transformar(5) { |n| n * 10 } # => Resultado: 50

# 4. ejemplo práctico: una versión simplificada de map, hecha a mano
def mi_map(arreglo)
  resultado = []
  arreglo.each do |elemento|
    resultado << yield(elemento) # el bloque decide cómo transformar cada elemento
  end
  resultado
end

p mi_map([1, 2, 3]) { |n| n**2 } # => [1, 4, 9]

# 5. ejemplo práctico: una versión simplificada de select, hecha a mano
def mi_select(arreglo)
  resultado = []
  arreglo.each do |elemento|
    resultado << elemento if yield(elemento) # el bloque decide si se queda o no
  end
  resultado
end

p mi_select([1, 2, 3, 4, 5, 6]) { |n| n.even? } # => [2, 4, 6]
