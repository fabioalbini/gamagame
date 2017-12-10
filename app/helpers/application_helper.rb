module ApplicationHelper
  def bootstrap_alert_class(type)
    case type.to_sym
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    when :notice then "alert-info"
    else
      type
    end
  end
end
