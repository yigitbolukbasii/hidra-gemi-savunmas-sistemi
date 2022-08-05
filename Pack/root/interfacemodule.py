# Bul:
	def IsEditLineFocus(self):
		if self.ChatWindow.chatLine.IsFocus():
			return 1

		if self.ChatWindow.chatToLine.IsFocus():
			return 1
		return 0


# Altina ekle:
	if app.ENABLE_DEFENSE_WAVE:
		def BINARY_Update_Mast_HP(self, hp):
			self.wndMiniMap.SetMastHP(hp)

		def BINARY_Update_Mast_Window(self, i):
			self.wndMiniMap.SetMastWindow(i)
