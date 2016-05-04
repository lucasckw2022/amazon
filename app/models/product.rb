class Product < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :users, through: :favourites
  has_many :favourites, dependent: :nullify
  belongs_to :user

  validates :title,presence:true,uniqueness:true
  validates :price,presence:true
  validates :sale_price, presence:true, numericality: {less_than_or_equal_to: :price}

  before_validation :default_price

  def user_full_name
    user ? user.full_name : "Unknown User"
  end

  def default_price
    self.sale_price ||= self.price
  end

  def on_sale?
    if self.sale_price == self.price
      false
    else
      true
    end
  end

  def favourite_for(user)
    favourites.find_by_user_id user if user
  end

  # def like_for(user)
  #   likes.find_by_user_id user if user
  # end

end
