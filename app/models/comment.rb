class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  has_many :users, through: :likes
  has_many :likes, dependent: :nullify
  # validates :body, presence:true
  validates :star, presence:true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}

  def user_full_name
    user ? user.full_name : "Unknown User"
  end

end
