require 'spec_helper'

describe package('mysql') do
  it { should be_installed }
end

