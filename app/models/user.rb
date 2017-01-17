class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:cas]

  def self.from_omniauth(access_token)
    User.where(provider: access_token.provider, uid: access_token.uid).first_or_create do |user|
      user.uid = access_token.uid
      user.provider = access_token.provider
      user.username = access_token.uid
      user.email = "#{access_token.uid}@princeton.edu"
    end
  end
end
