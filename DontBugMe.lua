local data = {}

local function filter(msg, a2)
    a2 = a2 or arg2     -- be future proof for when Judgement Day comes for argN globals
    if data[a2] and data[a2] == msg then
        return true
    else
        data[a2] = msg
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", filter)