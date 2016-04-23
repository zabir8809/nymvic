# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#set :environment, "development"
set :environment, "production"
set :output, {:error=> "log/cron_error_log.log", :standard=> 'log/cron_log.log'}
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 1.day, :at=> '5:25 pm' do
	runner "SendSmsJob.perform_later"
end

every 1.day, :at=> '02:14 pm' do
	runner "SendEmailJob.perform_later"
end