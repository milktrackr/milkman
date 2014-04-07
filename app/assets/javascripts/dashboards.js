$(".dashboards.index").ready(function(){
    Highcharts.setOptions({
        global: {
            timezoneOffset: 4 * 60
        }
    });


	$('#milk-line').highcharts({
            chart: {
            	backgroundColor: "#f2f2f2",
	        	  borderColor: null,
              type: 'spline',
              zoomType: 'x'
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
                    year: '%b',
                    minute: '%I:%M %p',
                    hour: '%I:%M %p'
                }
            },
            yAxis: {
                title: {
                    text: 'Milk (ml)'
                },
                max: 2000,
                min: 0
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        Highcharts.dateFormat('%b. %e, %I:%M %p', this.x) +': '+ this.y +' ml';
                }
            },
            
            series: [{
                name: 'Milk Consumption',
                // Define the data points. All series have a dummy year
                // of 1970/71 in order to be compared on the same x axis. Note
                // that in JavaScript, months start at 0 for January, 1 for February etc.
                data: gon.all_measurements
            }]
        });


$('#max-button').click(function() {
        var chart = $('#milk-line').highcharts();
        chart.xAxis[0].setExtremes(gon.first_measurement_time);
    });


$('#week-button').click(function() {
        var chart = $('#milk-line').highcharts();
        chart.xAxis[0].setExtremes(Date.now() - 604800000);
    });

$('#day-button').click(function() {
        var chart = $('#milk-line').highcharts();
        chart.xAxis[0].setExtremes((Date.now() - 86400000));
    });

$('#hour-button').click(function() {
        var chart = $('#milk-line').highcharts();
        chart.xAxis[0].setExtremes((Date.now() - 3600000));
    });

    $('#milk-gauge').highcharts({  
        chart: {
            type: 'gauge',
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            borderColor: null,
            borderWidth: "20px",
            plotBorderWidth: 0,
            plotShadow: false,
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
            max: gon.current_container_size,
            
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
                text: 'ml'
            },
            plotBands: [{
                from: 0,
                to: Math.round(gon.current_container_size/3),
                color: '#DF5353' // red
            }, {
                from: Math.round(gon.current_container_size/3),
                to: Math.round(2*(gon.current_container_size/3)),
                color: '#DDDF0D' // yellow
            }, {
                from: Math.round(2*(gon.current_container_size/3)),
                to: gon.current_container_size,
                color: '#55BF3B' // green
            }]        
        },
        series: [{
            name: 'Milk Amount',
            data: [gon.current_measurement],
            tooltip: {
                valueSuffix: 'ml'
            }
        }]
    
    });
	
});



