# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'shell' do
  watch(%r{^*.(rb|yml|file)$}) do
    #`rake spec:remote`
    ENV['RSPEC_FORMAT'] = 'growl'
    `rspec`
  end
end
