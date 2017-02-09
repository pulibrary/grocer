require 'open3'

module Grocer
  class ExportJob < ActiveJob::Base
    # Export a Fedora object to a Bag on disk
    # @param id [String] Resource id
    # @param ark [String] Resource ARK (if assigned)
    #
    # Config options
    # * baseurl: Fedora base url (optional)
    # * export_dir: Directory to export objects to
    # * metadata_template: YAML file containing default metadata
    # * jar: Path to the Fedora Import/Export JAR file
    # * predicates: Comma-separated list of predicates to use for resource membership (optional)
    def perform(pid, ark = nil)
      pair_path = pid.scan(/..?/).first(4).push(pid).join('/')
      url = "#{Grocer.configuration.baseurl}/#{pair_path}"
      dir = File.join(Grocer.configuration.export_dir, pair_path)
      export(pid, url, dir, ark)
    end

    private

    def export(pid, url, dir, ark = nil)
      export = Export.find_or_create_by(pid: pid)
      meta = bag_metadata url, ark
      Open3.popen2e(export_command(url, dir, meta.path)) do |_stdin, out, wait_thread|
        # update the Export record so it can be tracked/killed
        export.running!(wait_thread.pid)

        # monitor the thread
        log = monitor_process(out, wait_thread)
        log ? export.error!(log.path) : export.success!
      end
    ensure
      File.delete(meta.path) if meta
    end

    def monitor_process(out, wait_thread)
      # buffer output to tempfile
      log = Tempfile.create('export')
      until (line = out.gets).nil?
        log.write line
      end

      return log unless wait_thread.value.success?

      File.delete(log.path)

      nil
    end

    def bag_metadata(url, ark = nil)
      meta = Tempfile.create('bagmeta')
      meta.write File.open(Grocer.configuration.metadata_template).read
      meta.puts "  External-Identifier: #{ark}" if ark
      meta.puts "  Internal-Sender-Identifier: #{url}"
      meta.close

      meta
    end

    def export_command(url, dir, meta)
      cmd = %W(java -jar #{Grocer.configuration.jar} -m export -b -x -r #{url} -d #{dir})
      cmd << %W(-g default -G #{meta})
      cmd << %W(-p "#{Grocer.configuration.predicates}") if Grocer.configuration.predicates
      cmd.flatten.join(' ')
    end
  end
end
