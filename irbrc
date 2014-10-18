#!/usr/bin/env ruby
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

def y(obj)
    puts obj.to_yaml
end

if defined? Rails
  require 'rubygems'
  require 'hirb'

  Hirb.enable
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

def load_factory_girl!
  return if defined? FactoryGirl

  require 'factory_girl'

  if Dir.exists?(Rails.root.join('spec/factories'))
    Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| require f }
    puts "Factories loaded"
  elsif File.exists?(Rails.root.join('spec.factory.rb'))
    require Rails.root.join('factory.rb')
    puts "Factories loaded"
  else
    puts "You have to load factories manually"
  end
end
