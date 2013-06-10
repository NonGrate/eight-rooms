class User < ActiveRecord::Base
  attr_accessible :favorites, :name, :password, :rating, :surname, :username
end
