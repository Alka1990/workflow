var chart;
var graph;
var categoryAxis;

var chartData = 
[
  {
	  "country": "Appraisal",
		"visits": 100,
    "color": "#FF0F00"
	},
	{
		"country": "Flood",
		"visits": 120,
    "color": "#04D215"
    
	}, 
	{
		"country": "Environmental",
		"visits": 150,
    "color": "#0D8ECF"
	}
];


AmCharts.ready(function () {
  chart = new AmCharts.AmSerialChart();
	chart.dataProvider = chartData;
	chart.categoryField = "country";
  chart.position = "left";
  chart.angle = 30;
	chart.depth3D = 15;
  chart.startDuration = 1;
  
  categoryAxis = chart.categoryAxis;
	categoryAxis.labelRotation = 0;
  categoryAxis.dashLength = 5; //
  categoryAxis.gridPosition = "start";
  categoryAxis.autoGridCount = false;
	categoryAxis.gridCount = chartData.length;
  
    
	graph = new AmCharts.AmGraph();
	graph.valueField = "visits";
	graph.type = "column";	
  graph.colorField = "color";
	graph.lineAlpha = 0;
  graph.fillAlphas = 0.8;
  graph.balloonText = "[[category]]: <b>[[value]]</b>";
  
  chart.addGraph(graph);
  
  chart.write('chartdiv');
});