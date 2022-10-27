class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_tasks, through: :favorites, source: :task
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true

  def already_favorited?(task)
    self.favorites.exists?(task_id: task.id)
  end

  def self.guest
    find_or_create_by!(nickname: 'guestmember' ,email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.nickname = "guestmember"
    end
  end

end
