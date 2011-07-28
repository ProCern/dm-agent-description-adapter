# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dm-agent-description-adapter}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Sadauskas"]
  s.date = %q{2009-04-03}
  s.description = %q{AgentDescriptionAdapter provides a datamapper adapter for reading the agent template description xml files.}
  s.email = %q{pjs@absolute-performance.com}
  s.extra_rdoc_files = ["README.markdown", "lib/dm-agent-description-adapter.rb", "lib/dm-types/string_array.rb", "lib/dm-types/question-choicelist.rb"]
  s.files = ["spec/spec.opts", "spec/acceptance_spec.rb", "spec/fixtures/question.rb", "spec/fixtures/templates/dsc_index.xml", "spec/fixtures/templates/os/linux/linux-disk.dsc", "spec/fixtures/templates/os/linux/linux-memory.dsc", "spec/fixtures/templates/os/linux/linux-core.dsc", "spec/fixtures/templates/os/linux/linux-varlog.dsc", "spec/fixtures/templates/os/linux/linux-users.dsc", "spec/fixtures/templates/os/linux/linux-filesystem.dsc", "spec/fixtures/templates/os/linux/linux-network.dsc", "spec/fixtures/template.rb", "spec/spec_helper.rb", "README.markdown", "lib/dm-agent-description-adapter.rb", "lib/dm-types/string_array.rb", "lib/dm-types/question-choicelist.rb", "Rakefile", "MIT-LICENSE", "Manifest", "dm-agent-description-adapter.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://absolute-performance.com/opensource/dm-agent-description-adapter}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Dm-agent-description-adapter", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dm-agent-description-adapter}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{AgentDescriptionAdapter provides a datamapper adapter for reading the agent template description xml files.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, [">= 0"])
      s.add_runtime_dependency(%q<dm-types>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<dm-core>, [">= 0"])
      s.add_dependency(%q<dm-types>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<dm-core>, [">= 0"])
    s.add_dependency(%q<dm-types>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
