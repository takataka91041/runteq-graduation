class Article < ApplicationRecord
  belongs_to :user

  enum status: { unread: 0, reading: 1, done: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  validates :url, presence: true
end
