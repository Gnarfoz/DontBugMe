local previd, data = 0, {}

local function filter(self, event, msg, name, _, _, _, _, _, _, _, _, id)
	if previd == id then
		return false
	else
		previd = id
		if data[name] and data[name] == msg then
			return true
		else
			data[name] = msg
			return false
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", filter)