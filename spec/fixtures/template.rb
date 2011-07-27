require 'pathname'
require Pathname(__FILE__).dirname + '../../lib/dm-types/string_array'

class Template
  include DataMapper::Resource

  property :path,         String, :key => true
  property :name,         String
  property :description,  String
  property :max_associations_per_configuration, Integer
  property :restricted_platforms, StringArray
  property :restricted_clients,   StringArray

  has n, :questions

end

