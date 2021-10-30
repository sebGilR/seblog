require 'rails_helper'

RSpec.describe LearningLogEntry, type: :model do
  subject { build(:learning_log_entry) }

  describe 'validations' do
    it 'is valid with content' do
      expect(subject).to be_valid
    end

    it 'is invalid without content' do
      subject.content = nil
      expect(subject).to be_invalid
    end

    it 'is invalid without a learning_log' do
      subject.learning_log = nil
      expect(subject).to be_invalid
    end
  end
end
