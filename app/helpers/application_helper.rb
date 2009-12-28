# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def ticket_url(p, t)
    "https://theplant.lighthouseapp.com/projects/#{p.id}/tickets/#{t.id}-#{t.permalink}"
  end
end
