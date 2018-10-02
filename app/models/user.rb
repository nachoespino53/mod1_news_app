class User < ActiveRecord::Base
  has_many :guardados
  has_many :articles, through: :guardados
end
