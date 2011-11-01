require 'yaml'

def fixture(path)
  fixture_path = File.join(File.dirname(__FILE__), '../fixtures', path)
  case File.extname(path)
  when '.yml'
    YAML.load_file(fixture_path)
  else
    File.read(fixture_path)
  end
end
