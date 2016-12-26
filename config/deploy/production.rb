server '52.199.88.235', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/hiramatch/.ssh/id_rsa'
