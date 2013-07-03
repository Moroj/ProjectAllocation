class Department < ActiveRecord::Base
  validates_presence_of :title
  attr_accessible :title
  has_many :courses, :dependent => :destroy
end
