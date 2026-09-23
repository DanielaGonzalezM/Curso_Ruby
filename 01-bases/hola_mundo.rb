saludos = 'buenos días'

print "Hola Mundo \n"
print 'Introduce tu nombre: '

# nombre = gets.chomp
nombre = gets
nombre = nombre.chomp

puts 'Hola ' + nombre
puts "Hola #{nombre}, que tengas #{saludos}"
