require "bundler/gem_tasks"

def pump_dumps(dumps)
  dumps.each do |obj|
    case obj['action']
    when 'dump_failures'
      
      puts "\n"*50
      puts "= RSPEC START "*10
      
      failures = obj['body'].map do |spec, exception, backtrace|
        
        puts "\n"
        puts "  #{spec} (FAILED)"
        puts "   #{"- "*10}"
        puts "   #{exception}"
        puts "   #{backtrace.join("\n   ")}"
        
        [spec,exception].join("\n")
      end
      
      puts ""
      puts "= RSPEC END "*10
      
      Growl.notify(failures.join("\n\n"), {:title => "#{failures.size} specs failed", :name => 'rspec'})
    when 'dump_summary'
      total = obj['body']['example_count']
      failed = obj['body']['failure_count']
      pending = obj['body']['pending_count']
      succeded = total - (obj['body']['failure_count'] + obj['body']['pending_count'])
      
      title = "#{total} specs finished in #{obj['body']['duration'].round(1)}s"
      msg = "#{failed} failed, #{pending} pending, #{succeded} succeded"
      Growl.notify(msg, {:title => title, :name => 'rspec'})
    end
  end
end

namespace :spec do
  desc 'run specs on a remote server (script/spec_server)'
  task :remote do
    begin
      client = MarilynRPC::NativeClient.connect_tcp('192.168.56.101', 8483)
      runner = client.for :rspec
      json = runner.run
      begin
        dumps = JSON.parse(json)
        pump_dumps(dumps)
      rescue => e
        title = "ERROR: Tests were broken #{e}!"
        msg = json
        puts msg
        puts title
        Growl.notify(msg, {:title => title, :name => 'rspec'})
      end
    rescue => e
      title = "FATAL: Spec server down!?"
      msg = e.to_s
      puts title
      puts msg
      Growl.notify(msg, {:title => title, :name => 'rspec'})
    end
  end
end

