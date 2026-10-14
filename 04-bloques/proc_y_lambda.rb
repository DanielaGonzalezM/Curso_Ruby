# frozen_string_literal: true

# Un bloque "normal" (yield) no es un objeto, solo existe mientras se ejecuta
# el método que lo recibió. Proc y lambda SÍ son objetos: se pueden guardar
# en una variable, pasar como parámetro, y reutilizar varias veces.

# 1. Proc: envuelve un bloque de código en un objeto
sumar = proc { |a, b| a + b }
puts sumar.call(2, 3) # => 5
puts sumar.call(2, 3) # => 5 (sintaxis corta alternativa)
puts sumar[2, 3] # => 5 (otra sintaxis alternativa, poco común)

# 2. lambda: muy parecido a Proc, pero más estricto
doblar = ->(n) { n * 2 }
doblar2 = ->(n) { n * 2 } # sintaxis "stabby lambda", más usada en la práctica

puts doblar.call(4)  # => 8
puts doblar2.call(4) # => 8

# 3. diferencias clave entre Proc y lambda:
# a) lambda valida el número de argumentos, Proc no
proc_laxo = proc { |a, b| "a=#{a}, b=#{b}" }
puts proc_laxo.call(1) # => "a=1, b=" (no truena, b queda nil)

lambda_estricta = ->(a, b) { "a=#{a}, b=#{b}" }
# lambda_estricta.call(1) # => ArgumentError: wrong number of arguments (given 1, expected 2)
puts lambda_estricta.call(1, 2) # => "a=1, b=2"

# b) return dentro de un Proc sale del método que lo contiene; en lambda, solo sale de la lambda
def probar_proc
  mi_proc = proc { return 'desde el proc' } # return afecta a TODO el método
  mi_proc.call
  'esto no se alcanza a imprimir' # nunca se ejecuta
end

def probar_lambda
  mi_lambda = lambda {
    return 'desde la lambda' # return aquí solo sale de la lambda, no del método
    'esto nunca se alcanza, pero no importa' # rubocop:disable Lint/UnreachableCode
  }
  resultado = mi_lambda.call
  "la lambda devolvió: #{resultado}" # SÍ se ejecuta (a diferencia de probar_proc)
end

puts probar_proc   # => desde el proc
puts probar_lambda # => la lambda devolvió: desde la lambda

# 4. convertir un bloque recibido en un Proc con &block
# el & convierte el bloque pasado en un objeto Proc
def guardar_bloque(&block)
  puts block.class # => Proc
  block.call('Hola')
end

guardar_bloque { |texto| puts "Bloque ejecutado con: #{texto}" }

# 5. pasar un Proc/lambda como si fuera un bloque, con &
cuadrado = ->(n) { n**2 }
p [1, 2, 3].map(&cuadrado) # => [1, 4, 9] (el & convierte el Proc en un bloque)

# 6. símbolo a proc: &:metodo es un atajo muy común
p %w[hola mundo ruby].map(&:upcase) # => ["HOLA", "MUNDO", "RUBY"]
# equivale a: .map { |palabra| palabra.upcase }
