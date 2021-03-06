class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
 
  has_many :libraries, through: :books    
  has_many :books, dependent: :delete_all

  enum role: [:admin,:author]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :author
  end


end
