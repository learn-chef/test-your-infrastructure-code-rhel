require 'spec_helper'

describe 'postfix' do
  it 'is installed' do
    expect(package 'postfix').to be_installed
  end

  it 'is enabled and running' do
    expect(service 'postfix').to be_enabled
    expect(service 'postfix').to be_running
  end

  it 'is configured to use the example.com domain in outbound mail' do
    expect(file '/etc/postfix/main.cf').to contain /^mydomain = example.com$/
    expect(file '/etc/postfix/main.cf').to contain /^myorigin = example.com$/
  end
end
