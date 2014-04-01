$(function () {
	
    $('#highchart-gauge').highcharts({
	
	    chart: {
	        type: 'gauge',
	        plotBackgroundColor: null,
	        plotBackgroundImage: null,
	        borderColor: null,
	        borderWidth: "20px",
	        plotBorderWidth: 0,
	        plotShadow: false,
	        width: 360,
	        height: 180
	    },

	    credits: {
      	enabled: false
  		},
	    
	    title: {
	    	text: null
	    },

	    pane: {
	        startAngle: -150,
	        endAngle: 150,
	        background: [{
	            backgroundColor: {
	                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
	                stops: [
	                    [0, '#FFF'],
	                    [1, '#333']
	                ]
	            },
	            borderWidth: 0,
	            outerRadius: '109%'
	        }, {
	            backgroundColor: {
	                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
	                stops: [
	                    [0, '#333'],
	                    [1, '#FFF']
	                ]
	            },
	            borderWidth: 1,
	            outerRadius: '107%'
	        }, {
	            // default background
	        }, {
	            backgroundColor: '#DDD',
	            borderWidth: 0,
	            outerRadius: '105%',
	            innerRadius: '103%'
	        }]
	    },
	       
	    // the value axis
	    yAxis: {
	        min: 0,
	        max: 100,
	        
	        minorTickInterval: 'auto',
	        minorTickWidth: 1,
	        minorTickLength: 10,
	        minorTickPosition: 'inside',
	        minorTickColor: '#666',
	
	        tickPixelInterval: 30,
	        tickWidth: 2,
	        tickPosition: 'inside',
	        tickLength: 10,
	        tickColor: '#666',
	        labels: {
	            step: 2,
	            rotation: 'auto'
	        },
	        title: {
	            text: null
	        },
	        plotBands: [{
	            from: 0,
	            to: 20,
	            color: '#DF5353' // red
	        }, {
	            from: 20,
	            to: 60,
	            color: '#DDDF0D' // yellow
	        }, {
	            from: 60,
	            to: 100,
	            color: '#55BF3B' // green
	        }]        
	    },
	
	    series: [{
	        name: 'Speed',
	        data: [60],
	        tooltip: {
	            valueSuffix: ' ml'
	        }
	    }]
	
	});



		$('#highchart-line').highcharts({
            chart: {
            	backgroundColor: "#f2f2f2",
	        		borderColor: null,
              type: 'spline',
              width: 360,
	        		height: 180
            },
            title: {
                text: null
            },
            legend: {
            	enabled: false
            },
            credits: {
      				enabled: false
  					},
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: { // don't display the dummy year
                    month: '%e. %b',
                    year: '%b'
                }
            },
            yAxis: {
                title: {
                    text: 'Milk (ml)'
                },
                max: 1000,
                min: 0
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%e. %b', this.x) +': '+ this.y +' ml';
                }
            },
            
            series: [{
                name: 'Milk Consumption',
                // Define the data points. All series have a dummy year
                // of 1970/71 in order to be compared on the same x axis. Note
                // that in JavaScript, months start at 0 for January, 1 for February etc.
                data: [
                    [Date.UTC(1970,  9, 27), 1000 ],
                    [Date.UTC(1970, 10, 10), 1000 ],
                    [Date.UTC(1970, 10, 18), 908 ],
                    [Date.UTC(1970, 11,  2), 908 ],
                    [Date.UTC(1970, 11,  9), 908 ],
                    [Date.UTC(1970, 11, 16), 750 ],
                    [Date.UTC(1970, 11, 28), 750],
                    [Date.UTC(1971,  0,  1), 750],
                    [Date.UTC(1971,  0,  8), 750],
                    [Date.UTC(1971,  0, 12), 750],
                    [Date.UTC(1971,  0, 27), 750],
                    [Date.UTC(1971,  1, 10), 487],
                    [Date.UTC(1971,  1, 18), 487],
                    [Date.UTC(1971,  1, 24), 209],
                    [Date.UTC(1971,  2,  4), 209],
                    [Date.UTC(1971,  2, 11), 209],
                    [Date.UTC(1971,  2, 15), 209],
                    [Date.UTC(1971,  2, 25), 209],
                    [Date.UTC(1971,  3,  2), 50],
                    [Date.UTC(1971,  3,  6), 50],
                    [Date.UTC(1971,  3, 13), 1000 ],
                    [Date.UTC(1971,  4,  3), 1000 ],
                    [Date.UTC(1971,  4, 26), 880 ],
                    [Date.UTC(1971,  5,  9), 880],
                    [Date.UTC(1971,  5, 12), 880 ]
                ]
            }]
        });


});