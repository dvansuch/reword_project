class Scholar < ActiveRecord::Base
	validates :username, presence: true
	validates :username, uniqueness: true
	has_secure_password

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
