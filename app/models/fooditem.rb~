class Fooditem < ActiveRecord::Base
   acts_as_votable
  attr_accessible :name, :score, :totalvotes

  validates :name,  :presence => true
  has_many :voters

end
