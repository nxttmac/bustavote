class Vote < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user
  belongs_to :question

end
