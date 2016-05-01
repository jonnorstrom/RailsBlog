class Post < ActiveRecord::Base
  # if post gets deleted, it's dependents get deleted also
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
