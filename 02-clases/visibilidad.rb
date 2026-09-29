# Visibilidad de métodos: public (por defecto), private, protected.
# Controla qué métodos se pueden llamar desde AFUERA del objeto.

class CuentaBancaria
  def initialize(saldo)
    @saldo = saldo
  end

  def depositar(monto) # público por defecto
    @saldo += monto
    registrar_movimiento('depósito', monto) # sí se puede llamar desde adentro
  end

  attr_reader :saldo

  private # TODO: lo que sigue de aquí en adelante es privado

  def registrar_movimiento(tipo, monto)
    puts "Movimiento: #{tipo} de $#{monto}"
  end
end

cuenta = CuentaBancaria.new(100)
cuenta.depositar(50)
puts cuenta.saldo # => 150
# cuenta.registrar_movimiento('x', 1) # => NoMethodError (privado, no accesible desde afuera)

# protected: parecido a private, pero SÍ se puede llamar entre instancias
# de la misma clase (útil para comparar datos internos entre objetos)
class Persona
  def initialize(nombre, salario)
    @nombre = nombre
    @salario = salario
  end

  def gana_mas_que?(otra_persona)
    salario > otra_persona.salario # llamando a un método protected de OTRO objeto
  end

  protected

  attr_reader :salario
end

ana = Persona.new('Ana', 3000)
luis = Persona.new('Luis', 2500)

puts ana.gana_mas_que?(luis) # => true (funciona: se compara internamente)
# ana.salario # => NoMethodError (protected, no se puede llamar desde afuera)

# resumen:
#   public    -> cualquiera puede llamarlo (por defecto)
#   private   -> solo se puede llamar sin receptor explícito (self implícito),
#                ni siquiera otra instancia de la misma clase puede llamarlo directo
#   protected -> solo instancias de la misma clase (o subclases) pueden llamarlo
#                entre sí, pero no código externo
