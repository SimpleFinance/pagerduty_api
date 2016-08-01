#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'pagerduty_api/version'

Gem::Specification.new do |s|
  s.name         = 'pagerduty_api'
  s.version      = PagerdutyAPI::VERSION
  s.summary      = 'API client for v2 of the Pagerduty API.'
  s.author       = 'Simple'
  s.email        = 'infra@simple.com'
  s.homepage     = 'https://github.com/simplefinance/pagerduty_api'
  s.license      = 'Apache-2.0'
  s.require_path = 'lib'
  s.files        = Dir.glob('**/*')

  s.add_runtime_dependency('faraday', '~> 0.9.2')
end
