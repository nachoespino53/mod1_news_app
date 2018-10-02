class User < ActiveRecord::Base
  has_many :saves
  has_many :articles, through: :saves
end
