require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { build(:article) }

  it { should belong_to(:learning_log).optional(true) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }

  describe '#draft?' do
    it 'should initially be true' do
      expect(subject.draft?).to be true
    end

    it 'should be false after published' do
      subject.published!
      expect(subject.draft?).to be false
    end
  end

  describe '#published?' do
    it 'should initially be false' do
      expect(subject.published?).to be false
    end

    it 'should be true after published' do
      subject.published!
      expect(subject.published?).to be true
    end

    it 'should be false after drafted' do
      subject.draft!
      expect(subject.published?).to be false
    end
  end

  describe '#published_at' do
    it 'should be nil initially' do
      expect(subject.published_at).to be_nil
    end

    it 'should be set after published' do
      subject.published!
      expect(subject.published_at).to be_present
    end

    it 'should be nil after drafted' do
      subject.draft!
      expect(subject.published_at).to be_nil
    end
  end

  describe "#search" do
    before(:each) do
      @article = create(:article, title: 'foo', text: 'bar')
      Article.reindex
    end

    it "should return an empty array if no results" do      
      query = "same"
      results = Article.search(query)

      expect(results.count).to eq(0)
    end

    it "should return an array of matching articles" do
      query = "bar"
      results = Article.search(query, fields: ['text']).results
      
      expect(results.first).to eq(@article)
      expect(results.size).to eq(1)
    end

    context 'with an options hash' do
      it "should only find if 'bar' is in the text field" do
        query = "bar"
        results = Article.search(query, fields: [:text]).results
        
        expect(results.first).to eq(@article)
        expect(results.size).to eq(1)
      end

      it "should only find if 'bar' is in the title field" do
        query = "bar"
        results = Article.search(query, fields: [:title]).results
        
        expect(results.size).to eq(0)
      end
    end
  end
  
end
