require 'spec_helper'

describe Webpage do
  describe "associations" do
    it { should have_many(:widgets) }
  end
end
