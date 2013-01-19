require 'spec_helper'

describe Project do
  it "Validate name" do
    @project = Project.new
    @project.should_not be_valid
  end
end
