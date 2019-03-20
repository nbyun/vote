mongo_config = YAML.load_file(Rails.root.join('config', 'mongo.yml'))[Rails.env]
db_url = "mongodb://#{mongo_config['host']}:#{mongo_config['port']}"
#FileMongo = Mongo::Client.new(db_url, database: mongo_config['database'])

Mongoid.configure do |config|
  config.clients.default = {
    uri: db_url
  }
end