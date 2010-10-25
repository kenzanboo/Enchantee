class User < ActiveRecord::Base
  
  has_and_belongs_to_many :interests
  
  def name
    first_name + " " + last_name
  end
  
end
