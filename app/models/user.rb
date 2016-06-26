class User < ApplicationRecord
  has_many :routes
  has_many :business_processes, through: :routes
  validates :name, :email, presence: true, uniqueness: true
  validates :email, email_format: { message: "doesn't look like an email address" }
  has_secure_password

  after_destroy :ensure_an_admin_remains
  after_update :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.where(admin: true).count.zero?
        raise "Can't delete last admin"
      end
    end

end
