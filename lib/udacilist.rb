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
    rows = []
    @items.each_with_index do |item, position|
      rows << [position + 1, item.details]
    end
    table = Terminal::Table.new :title => @title.colorize(:red), :rows => rows
    puts table
  end
  
end
