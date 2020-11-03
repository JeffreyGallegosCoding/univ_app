class Course < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5, maximum: 50 }
  validates :short_name, presence: true, length: { minimum: 3, maximum: 6 }
  validates :description, presence: true


end