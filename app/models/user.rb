class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_moods
  has_many :moods, through: :user_moods
  belongs_to :role
  before_create :set_default_role
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
