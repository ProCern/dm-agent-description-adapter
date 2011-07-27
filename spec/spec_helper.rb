require 'rubygems'
require 'pathname'
require 'spec'
require 'pp'

require 'dm-core'

$LOAD_PATH << Pathname(__FILE__).dirname + "../lib"
require 'dm-agent-description-adapter'
require 'dm-types/question-choicelist'

