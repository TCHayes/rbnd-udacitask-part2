class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :type

  def initialize(description, options={})
    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
    @type = "event"
  end

  def details
    format_description(@description) + "event dates: " + format_date(@type, start_date: @start_date, end_date: @end_date)
  end
end