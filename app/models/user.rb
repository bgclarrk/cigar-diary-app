class User < ActiveRecord::Base
    has_secure_password
    validates :user_email, uniqueness: true
    has_many :reviews


end