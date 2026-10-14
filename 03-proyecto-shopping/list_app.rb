require './list'
require './item'

class ListApp
  attr_writer :list

  def initialize
    @list = List.new
  end

  def run
    puts 'Bienvenido a nuestra lista de Compras'
    loop do
      puts 'a - Agregar un articulo'
      puts 'r - Remover un articulo'
      puts 'v - Mostrar todos los articulos'
      puts 'm - Marcar un articulo'
      puts 'b - Borrar todos los articulos'
      puts 's - Salir'
      input = gets.chomp

      case input
      when 'a'
        puts 'Escribe el articulo a agregar:'
        text = gets.chomp
        @list.add_item(text)
        puts "'#{text}' ha sido agregado"
      when 'r'
        puts 'Escribe el indice del articulo a remover:'
        index = gets.chomp.to_i
        item = @list.remove_item(index)
        puts item ? "'#{item.text}' ha sido removido" : "No existe un articulo en el indice #{index}"
      when 'v'
        @list.show_all
      when 'm'
        puts 'Escribe el indice del articulo a marcar:'
        index = gets.chomp.to_i
        item = @list.check_item(index)
        puts item ? "'#{item.text}' ha sido marcado" : "No existe un articulo en el indice #{index}"
      when 'b'
        puts '¿Estas seguro que quieres borrar todo? (s/n)'
        confirmation = gets.chomp
        if confirmation == 's'
          @list.delete_all
          puts 'Lista borrada'
        else
          puts 'Operacion cancelada'
        end
      when 's'
        break
      else
        puts 'Opcion invalida, intenta de nuevo'
      end
    end
    puts 'Adios'
  end
end

list_app = ListApp.new
list_app.run
