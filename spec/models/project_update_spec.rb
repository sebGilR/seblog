require 'rails_helper'

RSpec.describe ProjectUpdate, type: :model do
  subject { build(:project_update) }

  describe 'validations' do
    it 'is valid with a description and a project' do
      expect(subject).to be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a project' do
      subject.project = nil
      expect(subject).to_not be_valid
    end
  end
end
