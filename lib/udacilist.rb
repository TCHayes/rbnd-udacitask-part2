class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    if !options[:title] #If a title isn't given, the list is titled "Untitled List"
      @title = "Untitled List"
    end
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    raise UdaciListErrors::InvalidItemType unless ["todo", "event", "link"].include?(type)
    if options[:priority]
      raise UdaciListErrors::InvalidPriorityValue if !["high", "medium", "low"].include?(options[:priority]) #Confusing code; trying to say !include?
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
  def table_print(items) #Added feature. Used for printing both full and filtered lists in table format.
    rows = []
    items.each_with_index do |item, position|
      rows << [position + 1, "#{item.type.capitalize}", "#{item.details}"]
    end
    table = Terminal::Table.new headings: ['', "Type", "Details"], rows: rows, title: @title
    puts table
  end
  def all
    table_print(@items)
  end
  def filter(type)
    results = []
    @items.each do |item|
      if item.type == type
        results << item
      end
    end
    if results == []
      puts "There are no items of that type in this list."
    else
      table_print(results)
    end
  end
end