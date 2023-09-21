ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  fragment = Nokogiri::HTML.fragment(html_tag)
  field = fragment.at('input, select, textarea')

  field['class'] = "#{field['class']} invalid" if field

  fragment.to_s.html_safe
end
