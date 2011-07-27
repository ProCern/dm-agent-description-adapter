require 'pathname'
require Pathname(__FILE__).dirname + '../../lib/dm-types/question-choicelist'
require 'dm-types'

class Question
  include DataMapper::Resource

  property :name,             String, :key => true
  property :text,             String
  property :validation_regex, Regexp
  property :default,          String
  property :choices,          ChoiceList

  belongs_to :template

end

