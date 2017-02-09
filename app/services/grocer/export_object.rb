module Grocer
  class ExportObject
    def self.call(target:, user: nil, comment: nil)
      Rails.logger.info "Exporting #{target.id}, user: #{user}, comment: #{comment}"
      Grocer::ExportJob.perform_later(target.id, target.identifier)
    end
  end
end
