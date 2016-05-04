class User < ActiveRecord::Base
  has_many :products, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :favourites, dependent: :nullify
  has_many :favourited_products, through: :favourites, source: :product
  has_many :likes, dependent: :nullify
  has_many :liked_comments, through: :likes, source: :comment

  validates :first_name, presence:true
  validates :last_name, presence:true
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: VALID_EMAIL_REGEX
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

end
