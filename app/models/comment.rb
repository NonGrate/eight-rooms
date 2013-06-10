class Comment < ActiveRecord::Base
  attr_accessible :postid, :text, :user
end
