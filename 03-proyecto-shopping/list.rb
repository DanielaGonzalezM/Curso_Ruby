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
    @items.delete_at(index)
  end

  def check_item(index)
    @items[index].checked = true
  end

  def delete_all
    @items.clear
  end

  def show_all
    if @items.empty?
      puts 'No hay articulos en la lista'
    else
      @items.each do |index|
        puts "#{index} - #{@items[index]}"
      end
    end
  end
end
