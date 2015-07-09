module RailroadStatus
  extend ActiveSupport::Concern

  included do
    validates :status, presence: true

    enum status: { usually: 0, delay: 1, stop: 2 }
  end
end