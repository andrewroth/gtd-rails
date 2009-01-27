set :application, "globaltechdev.org"
set :repository,  "git://github.com/andrewroth/gtd-rails.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
default_run_options[:pty] = true
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache
set :git_enable_submodules, 1
ssh_options[:forward_agent] = true
ssh_options[:port] = 40022

set :use_sudo, false

role :app, "gtd.ministryhacks.com"
role :web, "gtd.ministryhacks.com"
role :db, "gtd.ministryhacks.com", :primary => true
set :deploy_to, "/var/www/globaltechdev.org"


# define the restart task
desc "Restart the web server"
deploy.task :restart, :roles => :app do
  run "touch #{deploy_to}/current/tmp/restart.txt"
end  

desc "Add linked files after deploy and set permissions"
task :after_update_code, :roles => :app do
  run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "ln -s #{shared_path}/config/amazon_s3.yml #{release_path}/config/amazon_s3.yml"
  # expires symlink for apache expires headers
  run "ln -s #{release_path}/public #{release_path}/public/expires"
  
  # create the tmp folders
  run "mkdir -p -m 770 #{shared_path}/tmp/{cache,sessions,sockets,pids}"
  run "rm -Rf #{release_path}/tmp"
  run "ln -s #{shared_path}/tmp #{release_path}/tmp"
end

# You can use "transaction" to indicate that if any of the tasks within it fail,
# all should be rolled back (for each task that specifies an on_rollback
# handler).

desc "A task demonstrating the use of transactions."
task :long_deploy do
  transaction do
    deploy.update_code
    # deploy.disable_web
    deploy.symlink
    deploy.migrate
  end

  deploy.restart
  # deploy.enable_web
end

desc "Automatically run cleanup"
task :after_deploy, :roles => :app do
  deploy.cleanup
end