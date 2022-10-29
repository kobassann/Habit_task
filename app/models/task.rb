class Task < ApplicationRecord
  belongs_to :member, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags

  validates :content, presence: true
  validates :memo, presence: true

  def self.search(search)
    if search
      Task.where(['content Like ?', "%#{search}%"])
    else
      Task.all
    end
  end
end
