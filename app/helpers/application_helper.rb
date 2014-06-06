module ApplicationHelper

  def full_title page_title
    base_title
    if page_title.empty? then base_title
    else "#{base_title} | #{page_title}"; end
  end

  def base_title
    'Harmonize'
  end

  def data_format data
    if   data.empty? then 'N/A'
    else data; end
  end
end
