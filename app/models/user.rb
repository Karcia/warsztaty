class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  validates_presence_of :email, :password, :firstname, :lastname

  def admin?
  	is_admin
  end

  def full_name
    s = ""
    s += firstname if firstname.present?
    s += " " if firstname.present? and lastname.present?
    s += lastname if lastname.present?
    s
  end
end