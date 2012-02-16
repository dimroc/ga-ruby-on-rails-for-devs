namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    # display database configuration for current Rails environment
  end
end


