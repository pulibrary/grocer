module Grocer
  class Export < ApplicationRecord
    validates :pid, presence: true, uniqueness: true

    def running!(job_pid)
      self.job = job_pid
      self.status = 'running'
      save!
    end

    def success!
      self.job = nil
      self.status = 'success'
      self.last_success = Time.current
      save!
    end

    def error!(log)
      self.job = nil
      self.status = 'error'
      self.last_error = Time.current
      self.logfile = log
      save!
    end
  end
end
