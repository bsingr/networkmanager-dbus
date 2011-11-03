# load spec helper
Dir.glob(File.join(File.dirname(__FILE__), 'support/**/*')).each do |path|
  require path
end

# load lib
require File.join(File.dirname(__FILE__), '../lib/network_manager')

require 'bundler'
Bundler.require :development
require 'rspec/core/formatters/base_formatter'
class JsonFormatter < RSpec::Core::Formatters::BaseFormatter
  
  def start(example_count)
    @_dump_out = []
  end
  
  def close
    output.puts ::JSON.generate(@_dump_out)
  end
  
  def dump_failures
    return if failed_examples.empty?
    map = failed_examples.map do |example|
      #example.metadata
      [ example.full_description,
        example.metadata[:execution_result][:exception].message,
        example.metadata[:execution_result][:exception].backtrace  ]
    end
    @_dump_out << {:action => :dump_failures, :body => map}
  end
  
  def dump_summary(duration, example_count, failure_count, pending_count)
     @_dump_out << {:action => :dump_summary, :body => {
       :duration => duration,
       :example_count => example_count,
       :failure_count => failure_count,
       :pending_count => pending_count}}
  end
end

RSpec.configure do |config|
  config.formatter = begin
    case ENV['RSPEC_FORMAT']
      when 'growl'
        'Growl::RSpec::Formatter'
      when 'remote'
        'JsonFormatter'
      else
        'progress'
    end
  end
  
  config.mock_with :rr
  # or if that doesn't work due to a version incompatibility
  # config.mock_with RR::Adapters::Rspec
end

# load mocks
require File.join(File.dirname(__FILE__), 'mocks/init')
