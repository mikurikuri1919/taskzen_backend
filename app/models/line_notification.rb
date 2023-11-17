class LineNotification < ApplicationRecord
  belongs_to :user
  enum notification_time: { '8:00': 1, '10:00': 2, '12:00': 3, '15:00': 4 }
end
