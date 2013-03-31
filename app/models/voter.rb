class Voter < ActiveRecord::Base
  belongs_to :fooditem
  attr_accessible :user_id, :value
end
