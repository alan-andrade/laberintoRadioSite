require 'spec_helper'

describe Profile do
  it { should have_one :avatar }
  it { should accept_nested_attributes_for :avatar   }
end
