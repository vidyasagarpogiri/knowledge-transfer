class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  has_many :articles  
  has_many :questions
         
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
      user.email = auth.info.email
      user.name = auth.info.name
      user.save!
    end
  end
  
  def password_required?
    super && provider.blank?
  end 
  
end
