require 'rails_helper'

# RSpec.configure do |config|
#   config.include ActionView::TestCase::Behavior, type: :helper
# end

RSpec.describe NavigationHelper, type: :helper do
  context 'signed in user' do
    before(:each) { allow(helper).to receive(:user_signed_in?).and_return(true) }

    describe '#collapsible_links_partial_path' do
      it "returns signed_in_links partial's path" do
        expect(helper.collapsible_links_partial_path).to eq(
          'layouts/navigation/collapsible_elements/signed_in_links'
        )
      end
    end
  end

  context 'non-signed in user' do
    before(:each) { allow(helper).to receive(:user_signed_in?).and_return(false) }

    context '#collapsible_links_partial_path' do
      it "returns non_signed_in_links partial's path" do
        expect(helper.collapsible_links_partial_path).to(
          eq 'layouts/navigation/collapsible_elements/non_signed_in_links'
        )
      end
    end
  end
end
