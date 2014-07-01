module ApplicationHelper
  include Pundit

  def full_title(page_title)
    base_title
    if page_title.empty? then base_title
    else "#{base_title} | #{page_title}"; end
  end

  def base_title
    'Harmonize'
  end

  def data_format(data)
    data.nil? || data.empty? ? 'N/A' : data
  end

  def phone_format(phone)
    phone.nil? || phone.empty? ? 'N/A' : number_to_phone(phone, area_code: true)
  end

  def icon(icon, text="", html_options={})
    content_class = "fa fa-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << " #{text}" unless text.blank?
    html.html_safe
  end

  def logged_in_format(user)
    if current_user.admin? then "Logged in as Admin: #{user.handle}"
    else "Logged in as User: #{user.handle}"; end
  end
end
