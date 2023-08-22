module NotificationsHelper
  def notifications
    Notification.all.order(id: :desc).limit(5)
  end
end
