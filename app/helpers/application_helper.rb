module ApplicationHelper
  def error_for(record, field, err_string)
    if !record.errors[field].empty?
      return "<div class='error'>#{err_string}</div>".html_safe
    end
  end
end
