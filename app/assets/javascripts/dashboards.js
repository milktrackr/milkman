$(".dashboards.index").ready(function(){
    Highcharts.setOptions({
        global: {
            timezoneOffset: 5 * 60
        }
    });


	$('#milk-line').highcharts({
            chart: {
            	backgroundColor: "#f2f2f2",
	        	borderColor: null,
                type: 'spline',
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
                // dateTimeLabelFormats: { // don't display the dummy year
                //     month: '%e. %b',
                //     year: '%b',
                //     minute: '%H:%M',
                //     hour: '%H:%M'
                // }
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
                        Highcharts.dateFormat('%H:%M', this.x) +': '+ this.y +' ml';
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
	
});



