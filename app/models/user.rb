class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :provider, :uid, :username
  has_and_belongs_to_many :projects

  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.username = auth["info"]["name"]
  end
 end

end
