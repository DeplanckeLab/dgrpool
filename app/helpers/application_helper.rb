module ApplicationHelper

  def display_reference s
    return "<br/><i>#{s.authors}, #{s.year}</i><br/>#{s.title}<br/>"
  end

  def display_status s
    status = s.status
    return (status) ? "<div class='badge bg-#{status.css_class}'>#{status.name}</div>" : 'NA'
  end

  
end
