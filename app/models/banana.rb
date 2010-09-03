class Banana < ActiveRecord::Base
  belongs_to :User
  
  validates_presence_of :number_of_bananas, :when_bought, :user_id
end
