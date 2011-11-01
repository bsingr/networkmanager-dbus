# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'shell' do
  watch(%r{^*.(rb|yml|file)$}) { `rake spec:remote` }
end
