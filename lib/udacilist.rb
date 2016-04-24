class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    if !options[:title]
      @title = "Untitled List"
    end
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    raise UdaciListErrors::InvalidItemType unless ["todo", "event", "link"].include?(type)
    if options[:priority]
      raise UdaciListErrors::InvalidPriorityValue if !["high", "medium", "low"].include?(options[:priority]) #Messy code; trying to say!include?
    end
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
  end
  def delete(index)
    if index > @items.length
      raise UdaciListErrors::IndexExceedsListSize
    end
    @items.delete_at(index - 1)
  end
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
