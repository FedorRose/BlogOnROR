class Post < ApplicationRecord
  dragonfly_accessor :image
  has_many :comment
  belongs_to :cat
end
