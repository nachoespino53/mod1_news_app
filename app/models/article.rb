class Article < ActiveRecord::Base
  belongs_to :topic
  has_many :saves
end
