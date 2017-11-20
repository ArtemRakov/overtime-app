module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def employee?
    current_user.type == "Employee"
  end

  def admin?
    admin_types.include?(current_user.type)
  end

  def status_label(status)
    status_span_generator(status)
  end

  def admin_types
    ["AdminUser"]
  end

  private

  def status_span_generator(status)
    case status
    when 'Submitted'
      content_tag(:span, status, class: "label label-primary")
    when 'Approved'
      content_tag(:span, status, class: "label label-success")
    when 'Rejected'
      content_tag(:span, status, class: "label-danger")
    when 'Pending'
      content_tag(:span, status, class: "label label-primary")
    when 'Confirmed'
      content_tag(:span, status, class: "label label-primary")
    end
  end
end
