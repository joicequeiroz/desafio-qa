require 'cucumber'
require 'faker'
require 'httparty'
require 'rspec'
require 'yaml'

CONFIG = YAML.load_file("#{Dir.pwd}/config/ambiente.yml")
