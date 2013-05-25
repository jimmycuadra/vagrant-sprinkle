package :git do
  apt 'git-core'
end

package :vim do
  apt 'vim'
end

policy :development, roles: :main do
  requires :git
  requires :vim
end

deployment do
  delivery :capistrano do
    role :main, "127.0.0.1"
    set :user, "vagrant"
    ssh_options[:keys] = ["#{ENV['HOME']}/.vagrant.d/insecure_private_key"]
    ssh_options[:port] = 2222
  end
end
