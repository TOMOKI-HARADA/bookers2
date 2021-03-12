class Book < ApplicationRecord
  belongs_to :user
  def user
      return User.find_by(id: self.user_id)
  end
  validates :title, presence: true
  validates :body, presence: true
end
