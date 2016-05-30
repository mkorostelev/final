class User < ApplicationRecord
  validates :name, :email, presence: true, uniqueness: true
  validates :email, email_format: { message: "doesn't look like an email address" }
  has_secure_password

  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end

end
