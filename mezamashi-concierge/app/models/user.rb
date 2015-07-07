class User < ActiveRecord::Base
  before_create :assign_uuid

  private
  def assign_uuid
    self.uuid = SecureRandom.uuid
  end
end
