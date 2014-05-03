json.array!(@jobs) do |job|
  json.extract! job, :id, :document, :copies, :configuration, :status
  json.url job_url(job, format: :json)
end
