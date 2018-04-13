class Person < ApplicationRecord
  devise :omniauthable


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |person|
      person.provider = auth.provider
      person.uid = auth.uid
      person.first_name = auth.info.name.to_s.split(' ')[0]
      person.last_name = auth.info.name.to_s.split(' ')[1]
      person.oauth_token = auth.credentials.token
      person.oauth_expires_at = Time.at(auth.credentials.expires_at)
      person.save!
    end
  end


end
