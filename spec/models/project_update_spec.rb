require 'rails_helper'

RSpec.describe ProjectUpdate, type: :model do
  subject { build(:project_update) }
  
  it { should belong_to(:project) }
  it { should validate_presence_of(:description) }
end
