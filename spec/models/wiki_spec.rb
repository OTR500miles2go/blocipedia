require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }

  let(:wiki) { create(:wiki) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
    
  describe "attributes" do
    it "has a title, body, and user id attribute" do
      expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user_id: wiki.user_id)
    end
  end
end