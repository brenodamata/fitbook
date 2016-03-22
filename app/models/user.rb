class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Gender ISO https://en.wikipedia.org/wiki/ISO/IEC_5218
end
