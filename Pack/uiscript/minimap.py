# Ekleyin:
import app

# Dosyanin sonuna ekleyin:
if app.ENABLE_DEFENSE_WAVE:
	window["children"][0]["children"] += [
				{
					"name" : "MastWindow",
					"type" : "thinboard",

					"x" : 35,
					"y" : 160,

					"width" : 105,
					"height" : 37,
					"children" :
					[
						{
							"name" : "MastText",
							"type" : "text",

							"text_horizontal_align" : "center",

							"x" : 35,
							"y" : 8,

							"text" : uiScriptLocale.DEFANCE_WAWE_MAST_TEXT,
						},
						{
							"name" : "MastHp",
							"type" : "gauge",

							"x" : 10,
							"y" : 23,

							"width" : 85,
							"color" : "red",
							
							"tooltip_text" : uiScriptLocale.DEFANCE_WAWE_GAUGE_TOOLTIP,
						},
					],
				},]

