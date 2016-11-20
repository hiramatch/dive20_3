server '52.199.118.119', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/hiramatch/.ssh/id_rsa'
