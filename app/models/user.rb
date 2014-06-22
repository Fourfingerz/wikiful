class User < ActiveRecord::Base
	has_secure_password
	has_many :articles  #a user can own many articles in DB
	validates_uniqueness_of :email  #email has to be unique
	validates :name, presence: true #and these fields need to be filled in
	validates :email, presence: true
end
