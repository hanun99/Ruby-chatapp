class User < ApplicationRecord
  require 'digest'
  require 'redis'
  redis = Redis.new

  redis.ping

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
         validates :username, uniqueness: true, presence: true


         def gravatar_url
          gravatar_id = Digest::MD5::hexdigest(email).downcase
          "https://gravatar.com/avatar/#{gravatar_id}.png"
        end
      
        private
      
        def digest
          Digest::MD5.hexdigest(email.downcase)
        end
end
