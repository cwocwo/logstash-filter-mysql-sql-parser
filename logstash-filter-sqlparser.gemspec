Gem::Specification.new do |s|
  s.name          = 'logstash-filter-sqlparser'
  s.version       = '0.1.0'
  s.licenses      = ['Apache License (2.0)']
  s.summary       = 'Write a short summary, because Rubygems requires one.'
  s.description   = 'Write a longer description or delete this line.'
  s.homepage      = 'https://github.com/cwocwo/logstash-filter-mysql-sql-parser'
  s.authors       = ['cwocwo']
  s.email         = 'caiweiwei@inspur.com'
  s.require_paths = ['lib']

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','CONTRIBUTORS','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }
  
  # Jar dependencies
  s.requirements << "jar 'com.alibaba:druid', '1.0.18'"
  s.add_runtime_dependency 'jar-dependencies'

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 2.0"
  s.add_development_dependency 'logstash-devutils'
end
