json.extract! notification, :id, :notifiable_id, :notifiable_type, :notificationable_id, :notificationable_type, :title, :body, :created_at, :updated_at
json.url notification_url(notification, format: :json)
