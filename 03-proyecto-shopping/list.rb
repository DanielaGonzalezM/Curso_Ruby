require './item'

class List
  attr_writer :items

  def initialize
    @items = []
  end

  def add_item(text)
    item = Item.new(text)
    @items.push(item)
  end

  def remove_item(index)
    @items.delete_at(index) # delete_at ya devuelve el item removido, o nil si no existe
  end

  def check_item(index)
    item = @items[index]
    item.checked = true if item
    item # devuelve el item marcado, o nil si no existe
  end

  def delete_all
    @items.clear
  end

  def show_all
    if @items.empty?
      puts 'No hay articulos en la lista'
    else
      @items.each_with_index do |item, index|
        puts "#{index} - #{item}"
      end
    end
  end
end
