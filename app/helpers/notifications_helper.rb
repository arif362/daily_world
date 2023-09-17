module NotificationsHelper
  def notifications
    Notification.includes(:notifiable).order(id: :desc).limit(5)
  end
end
