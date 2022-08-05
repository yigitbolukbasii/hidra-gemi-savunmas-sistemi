#ui.py açin

#Bu class'i aratin

class Gauge(Window):

#bu fonksiyonlari bulup 

def __init__(self):
self.showtooltipevent = None
self.showtooltiparg = None
self.hidetooltipevent = None
self.hidetooltiparg = None
self.ToolTipText = None
def __del__(self):
self.showtooltipevent = None
self.showtooltiparg = None
self.hidetooltipevent = None
self.hidetooltiparg = None

# altina ekleyin

def SetShowToolTipEvent(self, func, *args):
self.showtooltipevent = func
self.showtooltiparg = args

def SetHideToolTipEvent(self, func, *args):
self.hidetooltipevent = func
self.hidetooltiparg = args

def ShowToolTip(self):
if self.ToolTipText:
self.ToolTipText.Show()

def HideToolTip(self):
if self.ToolTipText:
self.ToolTipText.Hide()

def SetToolTipText(self, text, x=0, y = -19):
self.SetFormToolTipText("TEXT", text, x, y)

def SetFormToolTipText(self, type, text, x, y):
if not self.ToolTipText: 
toolTip=createToolTipWindowDict[type]()
toolTip.SetParent(self)
toolTip.SetSize(0, 0)
toolTip.SetHorizontalAlignCenter()
toolTip.SetOutline()
toolTip.Hide()
toolTip.SetPosition(x + self.GetWidth()/2, y)
self.ToolTipText=toolTip

self.ToolTipText.SetText(text)