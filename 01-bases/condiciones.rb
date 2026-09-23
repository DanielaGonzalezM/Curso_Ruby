# prueba de formateo (esto debería cambiar si el formateador funciona)
prueba_formato = 'hola'

# if / elsif / else básico
edad = 20

if edad < 13
  puts 'Eres un niño'
elsif edad < 18
  puts 'Eres un adolescente'
else
  puts 'Eres un adulto'
end

# if como modificador de línea (útil para condiciones simples)
puts 'Eres mayor de edad' if edad >= 18

# unless: lo opuesto a if, se lee "a menos que"
tiene_permiso = false
puts 'Acceso denegado' unless tiene_permiso

# unless también se puede usar como modificador de línea
puts 'No tiene permiso' unless tiene_permiso

# Operador ternario (repaso): condición ? si_true : si_false
mensaje = edad >= 18 ? 'mayor de edad' : 'menor de edad'
puts "Ternario: #{mensaje}"

# El ternario también puede usarse directo dentro de un puts, sin variable intermedia
puts edad >= 18 ? 'Puede votar' : 'No puede votar'

# Cuidado: NO conviene anidar ternarios, se vuelve difícil de leer.
# Esto funciona pero es mala práctica:
nota_ejemplo = 7
resultado_anidado = if nota_ejemplo >= 9
                      'Excelente'
                    else
                      nota_ejemplo >= 6 ? 'Aprobado' : 'Desaprobado'
                    end
puts "Ternario anidado (evitar este estilo): #{resultado_anidado}"

# En vez de anidar ternarios, es más legible usar if/elsif o case/when

# case / when: alternativa a múltiples elsif
nota = 8

case nota
when 10
  puts 'Excelente'
when 8..9
  puts 'Muy bien'
when 6..7
  puts 'Aprobado'
else
  puts 'Necesitas mejorar'
end

# case también puede usarse sin variable, evaluando condiciones
temperatura = 30

if temperatura < 10
  puts 'Hace frío'
elsif temperatura < 25
  puts 'Clima templado'
else
  puts 'Hace calor'
end

# Condiciones combinadas con operadores lógicos
tiene_entrada = true
es_mayor_de_edad = true

if tiene_entrada && es_mayor_de_edad
  puts 'Puede ingresar al evento'
else
  puts 'No puede ingresar'
end

# Ejemplo con || (or): true si al menos una condición se cumple
es_socio = false
tiene_invitacion = true

if es_socio || tiene_invitacion
  puts 'Puede entrar sin pagar'
else
  puts 'Debe pagar entrada'
end

# Comprobar nil (muy común en Ruby)
valor = nil

if valor.nil?
  puts 'El valor no está definido'
else
  puts "El valor es: #{valor}"
end
