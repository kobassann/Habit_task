class Favorite < ApplicationRecord
  belongs_to :members
  belongs_to :tasks
end
