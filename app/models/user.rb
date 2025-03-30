class User < ApplicationRecord

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'must be a valid email address'

end
