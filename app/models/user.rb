class User < ApplicationRecord

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
    validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'must be a valid email address'

    validate :validate_campaigns_structure

private

def validate_campaigns_structure
  required_keys = %w[campaign_name campaign_name]
  unless self.campaigns_list.is_a?(Hash) && required_keys.all? { |key| self.campaigns_list.key?(key) }
    errors.add(:campaigns_list, "must contain required keys: #{required_keys.join(', ')}")
  end
end
end
