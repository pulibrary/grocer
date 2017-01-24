# grocer
Backup manager for Fedora's produce.

## Installation

* Add Grocer to your Gemfile

   ```
   gem 'grocer', github: 'pulibrary/grocer'
   ```

* Then run the Grocer installation

   ```
   bundle install
   rails g grocer:install
   rake db:migrate
   ```

* If your application is based on CurationConcerns 2.0 or Hyrax, you can trigger a Grocer export on
  workflow changes by adding this service call to an action:

   ```
   "methods": ["Grocer::ExportObject"]
   ```

and then reloading your workflow:

   ```
   rake curation_concerns:workflow:load
   ```


## Configuration

To configure Grocer's behavior, you can add an initializer:

```
Grocer.configure do |conf|
  conf.export_dir = ENV['GROCER_EXPORT_DIR'] || Rails.root.join('tmp', 'export')
end
```

The available configuration options are:

* `baseurl`: Fedora base URL, defaults to using ActiveFedora settings

* `export_dir`: Base directory to export resources to, defaults to `/pub/export`

* `metadata_template`: YAML file defining Bag metadata, defaults to `[export_dir]/metadata.yml`

* `jar`: Import/Export Java JAR file, defaults to `[export_dir]/export.jar`

* `predicates`: Comma-separated list of membership predicates to follow when retrieving a resources,
   defaults to `pcdm:hasMember,ldp:contains`

See the [Fedora Import/Export README](https://github.com/fcrepo4-labs/fcrepo-import-export) for more 
information about BagIt metadata, membership predicates, and the Import/Export tool in general.

## Required files

You must create two files required by the import/export tool:

* The Import/Export JAR file, which can be downloaded from the [Import/Export releases]
(https://github.com/fcrepo4-labs/fcrepo-import-export/releases).

* A Bag metadata config file, such as:

   ```
   bag-info.txt:
     Source-Organization: York University Libraries
     Organization-Address: 4700 Keele Street Toronto, Ontario M3J 1P3 Canada
     Contact-Name: Nick Ruest
     Contact-Phone: +14167362100
     Contact-Email: ruestn@yorku.ca
     External-Description: Sample bag exported from fcrepo
     External-Identifier: SAMPLE_001
     Bag-Group-Identifier: SAMPLE
     Internal-Sender-Identifier: SAMPLE_001
     Internal-Sender-Description: Sample bag exported from fcrepo
   ```
