import { positionChatWindows } from './position_and_visibility';

// console.log("close.js.erb");

$('body')
    .find("[data-pconversation-id='" + "<%= @conversation_id %>" + "']")
    .parent()
    .remove();
positionChatWindows();