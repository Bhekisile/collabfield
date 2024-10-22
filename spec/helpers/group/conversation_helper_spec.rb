require 'rails_helper'

RSpec.describe Group::ConversationsHelper, type: :helper do
  context '#contacts_except_recipient' do
    it 'return all contacts, except the opposite user of the chat' do
      contacts = create_list(:contact, 
                              5, 
                              user_id: current_user.id, 
                              accepted: true)

      contacts << create(:contact, 
                          user_id: current_user.id, 
                          contact_id: recipient.id,
                          accepted: true)
      helper.stub(:current_user).and_return(current_user)
      expect(helper.contacts_except_recipient(recipient)).not_to include recipient
    end
  end

  context '#create_group_conv_partial_path' do
    let(:contact) { create(:contact) }

    it "returns a create_group_conversation partial's path" do 
      helper.stub(:recipient_is_contact?).and_return(true)
      expect(helper.create_group_conv_partial_path(contact)).to(
        eq 'private/conversations/conversation/heading/create_group_conversation'
      )
    end

    it "returns an empty partial's path" do 
      helper.stub(:recipient_is_contact?).and_return(false)
      expect(helper.create_group_conv_partial_path(contact)).to(
        eq 'shared/empty_partial'
      )
    end
  end
end
