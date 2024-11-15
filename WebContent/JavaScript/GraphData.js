
var pie = new d3pie("pieChart", {

	"size": {
		"canvasWidth": 400,
		"canvasHeight":300,
		"pieOuterRadius": "90%"
	},
	"data": {
		"sortOrder": "value-desc",
		"content": [
			{
				"label": "Cash Flow",
				"value": 20000,
				"color": "#4285F4"
			},
			{
				"label": "In Process",
				"value": 60000,
				"color": "#FBBC05"
			},
			{
				"label": "Paid",
				"value": 154011,
				"color": "#34A853"
			},
			{
				"label": "Rejected",
				"value": 50000,
				"color": "#EA4335"
			}
		]
	},
	"labels": {
		"outer": {
			"pieDistance": 32
		},
		"inner": {
			"hideWhenLessThanPercentage": 3
		},
		"mainLabel": {
			"fontSize": 11
		},
		"percentage": {
			"color": "#ffffff",
			"decimalPlaces": 0
		},
		"value": {
			"color": "#adadad",
			"fontSize": 11
		},
		"lines": {
			"enabled": true
		},
		"truncation": {
			"enabled": true
		}
	},
	"effects": {
		"pullOutSegmentOnClick": {
			"effect": "linear",
			"speed": 400,
			"size": 8
		}
	},
	"misc": {
		"gradient": {
			"enabled": true,
			"percentage": 100
		}
	}
});


