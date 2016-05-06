class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo" then @items.push TodoItem.new(description, options)
    when "event" then @items.push EventItem.new(description, options)
    when "link" then @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "#{type}: Invalid type of item"
    end
  end
  def delete(index)
    if index > 0 && index <= @items.length
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize, "There is no #{index} item in the list"
    end
  end
  def all
    puts "-".colorize(:light_blue) * @title.length
    puts @title.colorize(:red)
    puts "-".colorize(:light_blue) * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
