json.array! @notifications do |notification|
  json.actor notification.actor
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  # TODO: Add `json.url` for notification
end
