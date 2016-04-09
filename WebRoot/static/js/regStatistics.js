var maxdata;
function drowDayLine(chart,data){
		 var plot1 = $.jqplot(chart, [data], {
      	 axesDefaults: {
         	labelRenderer: $.jqplot.CanvasAxisLabelRenderer
      	 },
      	 axes: {
			xaxis: {
				renderer: $.jqplot.DateAxisRenderer,
				numberTicks:7,
				tickOptions: { formatString: "%Y-%#m-%d" }
 			},
			yaxis: {
				min:0,
				max:maxdata,
	 			rendererOptions: {
	 				forceTickAt0: true
				},
			}
		},
		highlighter: {
 			show: true
		},
		cursor: {
			show: false
		}
		});
		return plot1;
}
function drowMonthLine(chart,data){
		 var plot2 = $.jqplot(chart, [data], {
      	 axesDefaults: {
         	labelRenderer: $.jqplot.CanvasAxisLabelRenderer
      	 },
      	 axes: {
			xaxis: {
				renderer: $.jqplot.DateAxisRenderer,
				numberTicks:7,
				tickOptions: { formatString: "%Y-%#m" }
 			},
			yaxis: {
				min:0,
				max:maxdata,
	 			rendererOptions: {
				forceTickAt0: true
				}
			}
		},
		highlighter: {
 			show: true
		},
		cursor: {
			show: false
		}
		});
		return plot2;
}   