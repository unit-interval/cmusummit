# Loads server specific config from config/config.yaml

begin
  APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
rescue Errno::ENOENT => e
  puts "ERROR: #{e}"
  puts "copy config/config.yml.example to config/config.yml and edit it"
  APP_CONFIG = {}
#  exit 1
end
