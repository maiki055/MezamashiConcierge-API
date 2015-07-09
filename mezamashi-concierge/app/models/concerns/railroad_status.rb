module RailroadStatus
  extend ActiveSupport::Concern

  included do
    validates :status, presence: true

    enum status: { created: 0, draft: 1, published: 2 }
  end
end