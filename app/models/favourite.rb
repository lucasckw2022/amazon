class Favourite < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def favourite_for(user)
    favourites.find_by_user_id user if user
  end
  
end
