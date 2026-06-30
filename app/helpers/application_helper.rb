module ApplicationHelper
  #to make dates look friendly
  def friendly_date(date)
    return "" if date.blank?

    case date.to_date
    when Date.current
      "Today"
    when Date.current + 1
      "Tomorrow"
    when Date.current - 1
      "Yesterday"
    else
      date.strftime("%a, %-d %b")
    end
  end
end
