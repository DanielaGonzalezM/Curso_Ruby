# Un Hash es una colección de pares clave-valor (como un diccionario/mapa,
# NO es lo mismo que un objeto de una clase - más abajo se compara).

# 1. Crear hashes
persona = { 'nombre' => 'Ana', 'edad' => 30 } # claves string (sintaxis vieja)
persona2 = { nombre: 'Luis', edad: 25 } # claves symbol (sintaxis moderna, la más usada)
vacio = {}

# 2. Acceder a valores
puts persona['nombre']    # => "Ana"  (con clave string hay que usar comillas)
puts persona2[:nombre]    # => "Luis" (con clave symbol se usa :simbolo)

puts persona2[:apellido] # => nil (clave que no existe, no truena)
puts persona2.fetch(:apellido, 'sin apellido') # => 'sin apellido' (acceso "seguro")

# 3. Agregar o modificar valores
persona2[:apellido] = 'Pérez'
persona2[:edad] = 26 # sobreescribe el valor existente
p persona2 # => {nombre: "Luis", edad: 26, apellido: "Pérez"}

# store es un alias de []= (mismo resultado, sintaxis de método)
persona2.store(:ciudad, 'Medellín')
persona2.store(:edad, 27) # también sobreescribe si la clave ya existe
p persona2 # => {nombre: "Luis", edad: 27, apellido: "Pérez", ciudad: "Medellín"}

# 4. Quitar valores
persona2.delete(:apellido)
p persona2

# 5. Recorrer un hash
persona2.each do |clave, valor|
  puts "#{clave}: #{valor}"
end

# solo claves o solo valores
p persona2.keys    # => [:nombre, :edad]
p persona2.values  # => ["Luis", 26]

# 6. Verificar existencia
puts persona2.key?(:nombre)     # => true
puts persona2.has_key?(:correo) # => false (alias de key?)
puts persona2.value?('Luis')    # => true

# 7. Tamaño
puts persona2.size
puts persona2.empty?

# 8. Transformar valores (map devuelve un array de pares)
mayusculas = persona2.transform_values { |v| v.to_s.upcase }
p mayusculas

# 9. Filtrar
inventario = { manzanas: 10, peras: 0, uvas: 5 }
con_stock = inventario.select { |_clave, cantidad| cantidad > 0 }
p con_stock

# 10. Combinar hashes
base = { a: 1, b: 2 }
extra = { b: 20, c: 3 }
combinado = base.merge(extra) # si hay clave repetida, gana el segundo hash
p combinado # => {a: 1, b: 20, c: 3}

# 11. Hash anidado (estructuras más complejas, como un JSON)
usuario = {
  nombre: 'Marta',
  direccion: {
    ciudad: 'Bogotá',
    pais: 'Colombia'
  },
  hobbies: %w[leer correr]
}

puts usuario[:direccion][:ciudad] # => "Bogotá"
puts usuario[:hobbies].first # => "leer"

# 12. Convertir entre hash y array
pares = persona2.to_a
p pares # => [[:nombre, "Luis"], [:edad, 26]]

arreglo_de_pares = [[:x, 1], [:y, 2]]
puts arreglo_de_pares.to_h.inspect # => {x: 1, y: 2}

# ---------------------------------------------------------------------
# 13. Hash vs Objeto (clase) - la diferencia real
# ---------------------------------------------------------------------

# Un hash es SOLO datos, sin comportamiento propio:
punto_hash = { x: 3, y: 4 }
distancia = Math.sqrt((punto_hash[:x]**2) + (punto_hash[:y]**2))
puts distancia # => 5.0 (el cálculo vive AFUERA del hash)

# Una clase agrupa datos + comportamiento (esto sí es un "objeto" real):
class Punto
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distancia
    Math.sqrt((x**2) + (y**2)) # el método vive DENTRO del objeto
  end
end

punto_objeto = Punto.new(3, 4)
puts punto_objeto.distancia # => 5.0 (el objeto sabe calcular su propia distancia)

# Regla práctica:
# - Usa un Hash para datos simples, temporales, o estructuras tipo JSON/config.
# - Usa una clase cuando los datos necesitan comportamiento propio,
#   validaciones, o vas a crear muchas instancias con la misma lógica.
