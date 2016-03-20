set :enviroment, :development
set :output, "log/cron_log.log"

every :day, at: '00:01' do
  runner "VotingEndingJob.perform_later"
end
