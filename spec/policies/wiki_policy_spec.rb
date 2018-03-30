require 'spec_helper'
require 'devise'
require 'shoulda-matchers'
require 'pundit/rspec'

describe WikiPolicy, type: :policy do

  subject { described_class.new(user,wiki) }

  let(:user) { create(:user) }
  let(:wiki) { create(:wiki, user: user) }

  context "for a wiki user" do
  end
end