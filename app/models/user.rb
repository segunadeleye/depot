class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.count.zero?
        # exception is used for two resons:
        # 1. because it is raised inside a transaction, it causes an automatic rollback
        # in this case, the deletion of the last user is undone
        # 2. the exception signals the error back to the controller, where we can handle the exception and report the error
        raise "Can't delete the last user"
        # if you only want to abort the transaction but not otherwise signal an exception,
        # raise and ActiveRecord::Rollback exception because this is the only exception that
        # won't be passed on by ActiveRecord::Base.transaction
      end
    end
end
