json.extract! grocer_export, :id, :pid, :job, :status, :last_error, :last_success, :logfile, :created_at, :updated_at
json.url grocer_export_url(grocer_export, format: :json)