module Grocer
  class Export < ApplicationRecord
    validates :pid, presence: true
  end
end
