# AWS-TEST環境
server '54.64.51.15', user: 'hajime', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/cafepedia-test_key_rsa'

# AWS-本番環境
# server '13.113.90.206', user: 'hajime', roles: %w{app db web}
# set :ssh_options, keys: '~/.ssh/cafepedia_rsa'
