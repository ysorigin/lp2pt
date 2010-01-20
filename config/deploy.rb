set :application, "lp2pt"
set :repository,  "git@github.com:ysorigin/lp2pt.git"
set :deploy_to, "/home/theplantweb/apps/#{application}"
set :user, "theplantweb"
set :password, "webtheplant"
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :scm, :git
set :deploy_via, :remote_cache
set :keep_releases, 5
set :main_server_name, "shit.hl-lwll.com"



# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, main_server_name                          # Your HTTP server, Apache/etc
role :app, main_server_name                          # This may be the same as your `Web` server
role :db,  main_server_name, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end