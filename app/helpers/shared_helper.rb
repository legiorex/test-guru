module SharedHelper
  def current_year
    Time.now.strftime('%Y год')
  end

  def link(url, description)
    link_to(description, url, target: '_blank')
  end
end
