class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title, :description, :year_of_publication

  after_create :send_notification

  def send_notification
    BookMailerJob.perform_later(id, User.all.pluck(:id))
  end
end
