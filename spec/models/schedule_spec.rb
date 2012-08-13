require 'spec_helper'

describe Schedule do
  it { should belong_to :program  }
  it { should belong_to :user     }
end
