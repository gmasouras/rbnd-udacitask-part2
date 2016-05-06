class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type = "todo"
  end
  def details
    format_description(@description) + "due: " +
    format_date(@due,nil) +
    format_priority(@priority)
  end
end
