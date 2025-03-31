class User < ApplicationRecord

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'must be a valid email address'

    validate :validate_campaigns_structure

private

def validate_campaigns_structure
  required_keys = %w[campaign_name campaign_id]
  unless self.campaigns_list.is_a?(Array) && required_keys.all? {|key| self.campaigns_list.inject([]) { |result, hash| result | hash.keys }}
    errors.add(:campaigns_list, "must contain required keys: #{required_keys.join(', ')}")
  end
end
end
