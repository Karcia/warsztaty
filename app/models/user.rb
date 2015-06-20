class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  validates_presence_of :email, :firstname, :lastname
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  mount_uploader :avatar, AvatarUploader

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