class Department < ActiveRecord::Base
  validates_presence_of :title
  attr_accessible :title
  has_many :courses, :dependent => :destroy
  has_many :sprofiles
  has_many :aprofiles
  has_many :academics, :through => :aprofiles
  has_many :projects, :through => :academics
  validates_uniqueness_of :title
end
