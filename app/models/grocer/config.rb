module Grocer
  class Config
    attr_writer :baseurl, :export_dir, :jar, :metadata_template, :predicates

    # Fedora baseurl, defaults to ActiveFedora settings
    def baseurl
      @baseurl ||= "#{af_config[:url]}/#{af_config[:base_path]}"
    end

    # Directory to export to, defaults to '/pub/export'
    def export_dir
      @export_dir ||= '/pub/export'
    end

    # Bag metadata template, defaults to '[export_dir]/metadata.yml'
    def metadata_template
      @metadata_template ||= "#{export_dir}/metadata.yml"
    end

    # Fedora Import/Export JAR file, defaults to '[export_dir]/export.jar'
    def jar
      @jar ||= "#{export_dir}/export.jar"
    end

    # Predicates that define resource membership, defaults to 'pcdm:hasMember,ldp:contains'
    def predicates
      @predicates ||= 'http://pcdm.org/models#hasMember,http://www.w3.org/ns/ldp#contains'
    end

    private

    def af_config
      ActiveFedora.config.credentials
    end
  end
end
