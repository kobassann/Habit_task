class Task < ApplicationRecord
  belongs_to :members
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  # def start_time
  #   self.simple_calendar
  # end

end
