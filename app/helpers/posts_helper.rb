module PostsHelper
  def status_label(status)
    status_span_generator(status)
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
    end
  end
end
