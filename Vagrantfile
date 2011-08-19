Vagrant::Config.run do |config|
  config.vm.box = ENV['VBOX']
  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = "https://api.opscode.com/organizations/#{ENV['ORGNAME']}"
    chef.validation_key_path = File.join(ENV['HOME'], ".chef", "#{ENV['ORGNAME']}-validator.pem")
    chef.validation_client_name = "#{ENV['ORGNAME']}-validator"
    chef.run_list = ENV.has_key?('CHEF_RUN_LIST') ? ENV['CHEF_RUN_LIST'].split(",") : ["recipe[chef_handler]"]
  end
end
