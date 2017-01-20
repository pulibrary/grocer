module Grocer
  class Export < ApplicationRecord
    validates :pid, presence: true, uniqueness: true
  end
end
