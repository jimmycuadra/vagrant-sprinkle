# vagrant-sprinkle

A [Vagrant](http://www.vagrantup.com/) plugin to provision virtual machines with [Sprinkle](https://github.com/sprinkle-tool/sprinkle).

## Installation

```
$ vagrant plugin install vagrant-sprinkle
```

## Usage

### In the Vagrantfile

Use `:sprinkle` as the provisioner in your Vagrantfile:

``` ruby
Vagrant.configure('2') do |config|
  config.vm.provision(:sprinkle) do |sprinkle|
    sprinkle.script = 'sprinkle.rb'
    sprinkle.cloud = true
  end
end
```

The only required option is `script`, which should be a relative path to your Sprinkle install script. An example `Vagrantfile` is provided in the root of the repository.

### In the Sprinkle script

Set the SSH options for deploy in accordance with the details provided by `vagrant ssh-config`:

``` ruby
deployment do
  delivery :capistrano do
    role :vagrant, "127.0.0.1"
    set :user, "vagrant"
    ssh_options[:keys] = ["#{ENV['HOME']}/.vagrant.d/insecure_private_key"]
    ssh_options[:port] = 2222
  end
end
```

An example `sprinkle.rb` is provided in the root of the repository.

## Options

The following options can be set on the `sprinkle` config object (the block parameter).

* **script** (String, required): Relative path to a Sprinkle script to run.
* **only** (String): Only run sprinkle policies for the specified role.
* **test** (Boolean): Process, but don't perform any actions.
* **verbose** (Boolean): Provide verbose output.
* **cloud** (Boolean): Show powder cloud, i.e. package hierarchy and installation order.
* **force** (Boolean): Force installation of all packages, even if already installed.

## License

[MIT](http://opensource.org/licenses/MIT)
