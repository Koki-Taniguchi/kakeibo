require 'rails_helper'

RSpec.describe RecodeDecorator do
  let(:recode) { Recode.new.extend RecodeDecorator }
  subject { recode }
  it { should be_a Recode }
end
