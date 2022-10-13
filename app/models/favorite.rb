class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :task

  validates_uniqueness_of :task_id, scope: :member_id
end
