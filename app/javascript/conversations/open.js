import { positionChatWindows } from './position_and_visibility';

console.log("open.js.erb");

// export function openConversation(conversation_id) {
var conversation = $('body').find("[data-pconversation-id='" + 
                                "<%= @conversation.id %>" + 
                                "']");
var chat_windows_count = $('.conversation-window').length + 1;

if (conversation.length !== 1) {
  $('body').append("<%= j(render 'private/conversations/conversation',\
                                  conversation: @conversation,\
                                  user: current_user) %>");
  conversation = $('body').find("[data-conversation-id='" + 
                                "<%= @conversation.id %>" + 
                                "']");
}

// Toggle conversation window after its creation
$('.conversation-window:nth-of-type(' + chat_windows_count + ')\
   .conversation-heading').click();
// mark as seen by clicking it
setTimeout(function(){ 
  $('.conversation-window:nth-of-type(' + chat_windows_count + ')').click();
 }, 1000);
// focus textarea
$('.conversation-window:nth-of-type(' + chat_windows_count + ')\
   form\
   textarea').focus();

// repositions all conversation windows
positionChatWindows();
// }