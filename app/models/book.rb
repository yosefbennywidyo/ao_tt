class Book < ApplicationRecord
  belongs_to :author

  validates_presence_of :title, :description, :year_of_publication
end
