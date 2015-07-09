module RailroadStatus
  extend ActiveSupport::Concern

  included do
    validates :status, presence: true

    before_save :set_status

    enum status: { usually: 0, delay: 1, stop: 2 }
  end

  def set_status
    if isUsually?
      self.status = 'usually'
    elsif isStop?
      self.status = 'stop'
    else
      self.status = 'delay'
    end
  end

  private
  def isUsually?
    self.state =~ /平常運転/ || self.state_detail =~ /平常通り運転/
  end

  def isStop?
    self.state =~ /見合わせ/ || (self.state_detail =~ /見合わせ/ && self.state_detail !~ /平常通り運転/)
  end
end