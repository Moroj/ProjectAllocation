class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :accessible
  has_one :sprofile, :dependent => :destroy, :foreign_key => :student_id
  has_many :choices
  has_one :project, :through => :choices
  has_one :academic, :through => :project
  
  validates_uniqueness_of :email
  
  def collection_select method, collection, value_method, text_method, options = {}, html_options = {}
  end
   

end
