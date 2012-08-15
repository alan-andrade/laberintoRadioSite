require 'spec_helper'

describe Asset do
  it { should have_attached_file :image }
  it { should validate_attachment_content_type(:image).
              allowing('image/png', 'image/jpg').
              rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:image).
              less_than(2.megabytes) }
end
