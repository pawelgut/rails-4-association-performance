class Grandparent < ActiveRecord::Base
  has_many :parents
  belongs_to :grandparent
end
