class Interest < ActiveRecord::Base
  
  belongs_to :category
  has_and_belongs_to_many :users
  
  validates_existence_of :category
  validates_uniqueness_of :name
  validates_presence_of :name
  
end
