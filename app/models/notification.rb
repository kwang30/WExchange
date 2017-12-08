class Notification < ApplicationRecord
  after_create :send_push_notificaiton
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true


  scope :unread, ->{where read_at: nil}

  def send_push_notificaiton
    pusher = Pusher::Client.new(
      app_id: ENV['PUSHER_APP_ID'],
      key: ENV['PUSHER_KEY'],
      secret: ENV['PUSHER_SECRET'],
      cluster: ENV['PUSHER_CLUSTER']
    )
    channel = "user_#{recipient_id}"

    pusher.trigger(channel, 'new_notificaiton', {
        message: 'New Notification'
    })
  end
end
