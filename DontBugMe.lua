----------------------------
--      Declaration       --
----------------------------

DontBugMe = AceLibrary("AceAddon-2.0"):new("AceHook-2.0")

----------------------------
--      Main Functions    --
----------------------------

function DontBugMe:OnEnable()
	self.data = {}
	self:Hook("ChatFrame_OnEvent", "FilterMessage")
end

function DontBugMe:FilterMessage(event)
	if ( event == "CHAT_MSG_AFK" or event == "CHAT_MSG_DND") then
		if self.data[arg2] and self.data[arg2] ~= arg1 or not self.data[arg2] then
			self.data[arg2] = arg1
			self.hooks.ChatFrame_OnEvent.orig(event)
		end
	else
		self.hooks.ChatFrame_OnEvent.orig(event)
	end
end