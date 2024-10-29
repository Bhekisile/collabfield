# FactoryBot.define do
#   factory :group_conversation, class: 'Group::Conversation' do
#     association :users, factory: :user

#     factory :group_conversation_with_messages do
#       transient do
#         messages_count { 1 }
#       end

#       after(:create) do |group_conversation, evaluator|
#         create_list(:group_message, evaluator.messages_count,
#                     conversation: group_conversation)
#       end
#     end
#   end
# end

FactoryBot.define do
  factory :group_conversation, class: 'Group::Conversation' do
    # Define the relationship correctly with multiple users
    after(:create) do |group_conversation|
      # Add multiple users to the conversation
      group_conversation.users << create_list(:user, 2)
    end

    factory :group_conversation_with_messages do
      transient do
        messages_count { 1 }
      end

      after(:create) do |group_conversation, evaluator|
        create_list(:group_message, evaluator.messages_count,
                    conversation: group_conversation)
      end
    end
  end
end
