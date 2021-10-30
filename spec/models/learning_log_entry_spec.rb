require 'rails_helper'

RSpec.describe LearningLogEntry, type: :model do
  subject { build(:learning_log_entry) }

  it { should belong_to(:learning_log) }
  it { should validate_presence_of(:content) }
end
