# Duck typing: "si camina como pato y suena como pato, es un pato".
# En Ruby no importa la CLASE del objeto, sino si responde al método
# que necesitas. No se requiere herencia compartida ni interfaces (como
# sí exigen otros lenguajes con tipado estricto, ej. Java/C#).

class Pato
  def hacer_sonido
    'Cuac!'
  end
end

class Persona
  def hacer_sonido
    'Digo cuac porque estoy imitando a un pato'
  end
end

def hacer_ruido(objeto)
  # no importa si es un Pato, una Persona o cualquier otra clase,
  # solo importa que responda a hacer_sonido
  puts objeto.hacer_sonido
end

hacer_ruido(Pato.new)    # => Cuac!
hacer_ruido(Persona.new) # => Digo cuac porque estoy imitando a un pato

# se puede verificar si un objeto "sabe hacer" algo antes de llamarlo:
puts Pato.new.respond_to?(:hacer_sonido) # => true
puts Pato.new.respond_to?(:volar) # => false

# ejemplo más práctico: cualquier objeto que tenga each puede recorrerse igual,
# sin importar si es un Array, un Hash, un Range, o una clase personalizada
def imprimir_todo(coleccion)
  coleccion.each { |elemento| puts elemento }
end

imprimir_todo([1, 2, 3])          # Array
imprimir_todo({ a: 1, b: 2 })     # Hash (each da pares [clave, valor])
imprimir_todo(1..3) # Range

# clase personalizada que también "sabe" hacer each -> duck typing en acción
class ListaDeCompras
  include Enumerable # con each definido, Enumerable regala map, select, sort, etc.

  def initialize
    @items = []
  end

  def agregar(item)
    @items << item
  end

  def each(&block)
    @items.each(&block) # yield le pasa cada elemento al bloque recibido
  end
end

lista = ListaDeCompras.new
lista.agregar('Leche')
lista.agregar('Pan')
lista.agregar('Huevos')

imprimir_todo(lista) # funciona igual que con Array/Hash/Range, sin heredar de ellos
puts lista.map(&:upcase).inspect # => ["LECHE", "PAN", "HUEVOS"] (Enumerable en acción)
