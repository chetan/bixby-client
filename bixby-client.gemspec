# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: bixby-client 0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "bixby-client"
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chetan Sarva"]
  s.date = "2015-02-04"
  s.description = "Bixby Client"
  s.email = "chetan@pixelcop.net"
  s.executables = ["bixby"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".testguardrc",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/bixby",
    "bixby-client.gemspec",
    "lib/bixby-client.rb",
    "lib/bixby-client/app.rb",
    "lib/bixby-client/app/command.rb",
    "lib/bixby-client/app/commands/run.rb",
    "lib/bixby-client/app/file_finder.rb",
    "lib/bixby-client/client.rb",
    "lib/bixby-client/client/version.rb",
    "lib/bixby-client/command.rb",
    "lib/bixby-client/model.rb",
    "lib/bixby-client/model/agent.rb",
    "lib/bixby-client/model/base.rb",
    "lib/bixby-client/model/check.rb",
    "lib/bixby-client/model/command.rb",
    "lib/bixby-client/model/host.rb",
    "lib/bixby-client/model/metric.rb",
    "lib/bixby-client/modules.rb",
    "lib/bixby-client/modules/inventory.rb",
    "lib/bixby-client/modules/metrics.rb",
    "lib/bixby-client/modules/monitoring.rb",
    "lib/bixby-client/modules/repository.rb",
    "lib/bixby-client/patch/shellout.rb",
    "lib/bixby-client/script.rb",
    "lib/bixby-client/script/bundle.rb",
    "lib/bixby-client/script/distro.rb",
    "lib/bixby-client/script/platform.rb",
    "lib/bixby-client/script/util.rb",
    "lib/bixby-client/script_util.rb",
    "tasks/coverage.rake",
    "tasks/coveralls.rake",
    "tasks/jeweler.rake",
    "tasks/test.rake",
    "tasks/yard.rake",
    "test/base.rb",
    "test/bixby-client/test_command.rb",
    "test/bixby-client/test_platform_util.rb",
    "test/helper.rb",
    "test/patch/test_shellout.rb",
    "test/support/root_dir/etc/bixby.yml",
    "test/support/root_dir/etc/id_rsa",
    "test/support/root_dir/etc/server",
    "test/support/root_dir/etc/server.pub",
    "test/support/root_dir/repo/vendor/test_bundle/bin/cat",
    "test/support/root_dir/repo/vendor/test_bundle/bin/echo",
    "test/support/root_dir/repo/vendor/test_bundle/digest",
    "test/support/root_dir/repo/vendor/test_bundle/lib/test_bundle.rb",
    "test/support/root_dir/repo/vendor/test_bundle/manifest.json",
    "test/test_bixby-client.rb",
    "test/test_script_util.rb"
  ]
  s.homepage = "http://github.com/chetan/bixby-client"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Bixby Client"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bixby-common>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_runtime_dependency(%q<oj>, [">= 0"])
      s.add_runtime_dependency(%q<httpi>, [">= 0"])
      s.add_runtime_dependency(%q<curb>, [">= 0"])
      s.add_runtime_dependency(%q<mixlib-shellout>, [">= 0"])
      s.add_runtime_dependency(%q<fuzzy_file_finder>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<debugger>, [">= 0"])
      s.add_development_dependency(%q<debugger-pry>, [">= 0"])
      s.add_development_dependency(%q<test_guard>, [">= 0"])
      s.add_development_dependency(%q<rb-inotify>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_development_dependency(%q<rb-fchange>, [">= 0"])
    else
      s.add_dependency(%q<bixby-common>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<oj>, [">= 0"])
      s.add_dependency(%q<httpi>, [">= 0"])
      s.add_dependency(%q<curb>, [">= 0"])
      s.add_dependency(%q<mixlib-shellout>, [">= 0"])
      s.add_dependency(%q<fuzzy_file_finder>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<debugger>, [">= 0"])
      s.add_dependency(%q<debugger-pry>, [">= 0"])
      s.add_dependency(%q<test_guard>, [">= 0"])
      s.add_dependency(%q<rb-inotify>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_dependency(%q<rb-fchange>, [">= 0"])
    end
  else
    s.add_dependency(%q<bixby-common>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<oj>, [">= 0"])
    s.add_dependency(%q<httpi>, [">= 0"])
    s.add_dependency(%q<curb>, [">= 0"])
    s.add_dependency(%q<mixlib-shellout>, [">= 0"])
    s.add_dependency(%q<fuzzy_file_finder>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<debugger>, [">= 0"])
    s.add_dependency(%q<debugger-pry>, [">= 0"])
    s.add_dependency(%q<test_guard>, [">= 0"])
    s.add_dependency(%q<rb-inotify>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, [">= 0"])
    s.add_dependency(%q<rb-fchange>, [">= 0"])
  end
end

