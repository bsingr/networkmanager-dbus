require 'yaml'

def fixture_path(subpath)
  File.join(File.dirname(__FILE__), '../fixtures', subpath)
end

def fixture(subpath)
  path = fixture_path(subpath)
  case File.extname(path)
  when '.yml'
    YAML.load_file(path)
  else
    File.read(path)
  end
end

def merged_dbus_fixtures
  data = {}
  Dir.glob(fixture_path('*')).each do |path|
    data.merge!(YAML.load_file(path))
  end
  data
end

def object_paths_from_fixture(subpath)
  data = fixture(subpath)
  data.map{|object_path, hash| object_path}
end
