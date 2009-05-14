local data = {}

local function filter(self, event, ...)
	local msg, name = ...
	
    if data[name] and data[name] == msg then
        return true, ...
    else
        data[name] = msg
        return false, ...
    end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", filter)