json.array! @notifications do |notification|
  json.actor notification.actor
  json.action notification.action
  json.url notification.destination_url
  json.notifiable do
    if notification.notifiable.class.to_s.underscore.humanize.downcase == "transaction"
      json.type "request"
    else
      json.type "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
    end
  end
  # TODO: Add `json.url` for notification
end
