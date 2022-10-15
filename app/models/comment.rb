class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :task

  validates :comment_text, presence: true
end
