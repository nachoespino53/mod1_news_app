class Article < ActiveRecord::Base
  belongs_to :topic
  has_many :guardados
  has_many :users, through: :guardados
end
