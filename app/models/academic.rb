class Academic < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :timeoutable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessor :accessible
  has_one :aprofile, :dependent => :destroy, :foreign_key => :academic_id
  has_many :projects, :dependent => :destroy
  has_many :students, :through => :projects
  belongs_to :department
  
  validates_uniqueness_of :email
  
  def title
    "#{self.projects}"
  end
end
