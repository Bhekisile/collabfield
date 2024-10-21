FactoryBot.define do
  factory :group_conversation, class: 'Group::Conversation' do
    association :recipient, factory: :user
    association :sender, factory: :user

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
