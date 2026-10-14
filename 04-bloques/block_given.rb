# frozen_string_literal: true

# block_given? permite verificar si el método recibió un bloque o no,
# para evitar el error "LocalJumpError: no block given (yield)".

def saludar_mal
  yield # si llamamos a este método sin bloque, esto truena
end

def saludar_bien
  if block_given?
    yield
  else
    puts 'No me dieron un bloque, así que saludo por defecto'
  end
end

saludar_bien { puts '¡Hola desde el bloque!' }
saludar_bien # => No me dieron un bloque, así que saludo por defecto

# saludar_mal # => LocalJumpError: no block given (yield)

# patrón común: el bloque es opcional y, si no viene, se usa un valor por defecto
def calcular_total(precios, &block)
  if block_given?
    precios.sum(&block) # aplica el bloque a cada precio (ej. aplicar descuento)
  else
    precios.sum
  end
end

precios = [100, 200, 300]
puts calcular_total(precios) # => 600 (sin bloque, suma normal)
puts calcular_total(precios) { |p| p * 0.9 } # => 540.0 (con 10% de descuento)

# otro patrón: devolver un Enumerator si no hay bloque (como hacen each, map, etc.
# de la librería estándar cuando se llaman sin bloque)
def mis_numeros
  return enum_for(:mis_numeros) unless block_given?

  yield 1
  yield 2
  yield 3
end

mis_numeros { |n| puts "numero: #{n}" }

enumerador = mis_numeros # sin bloque, devuelve un Enumerator en vez de ejecutar
p enumerador.to_a # => [1, 2, 3]
