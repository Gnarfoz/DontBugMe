local previd, data, result = 0, {}, nil

local function filter(self, event, msg, name, _, _, _, _, _, _, _, _, id)
	if previd == id then
		return result
	else
		previd = id
		if data[name] and data[name] == msg then
			result = true
		else
			data[name] = msg
			result = false
		end
		return result
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_AFK", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_DND", filter)