json.jobs do
  json.array! @jobs do |job|
    json.partial! "jobs/job", job: job
  end
end
