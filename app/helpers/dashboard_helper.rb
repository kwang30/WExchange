module DashboardHelper

  def badge_for_request(request)
    badge = ""
    case request.status
    when -3
      badge = "<span class=\"new badge grey\" data-badge-caption=\"\">Cancelled by Creator</span>"
    when -2
      badge = "<span class=\"new badge grey\" data-badge-caption=\"\">Cancelled by Client</span>"
    when -1
      badge = "<span class=\"new badge grey\" data-badge-caption=\"\">Declined</span>"
    when 0
      badge = "<span class=\"new badge orange\" data-badge-caption=\"\">Awaiting Creator Approval</span>"
    when 1
      badge = "<span class=\"new badge green\" data-badge-caption=\"\">In Progress</span>"
    when 2
      badge = "<span class=\"new badge orange\" data-badge-caption=\"\">Awaiting Client Approval</span>"
    when 3
      badge = "<span class=\"new badge green\" data-badge-caption=\"\">Completed</span>"
    end
    badge.html_safe
  end
end
