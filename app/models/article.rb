class Article < ActiveRecord::Base
  belongs_to :topic
  has_many :saves
  has_many :users, through: :saves
end
