$(".dashboards.realtime").ready(function(){



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
              animation: Highcharts.svg,
              zoomType: 'x',
              events: {
                    load: function() {    
                        // set up the updating of the chart each second
                        var series = this.series[0];
                        setTimeout(updateChartData,1000);  
                          function updateChartData(){
                                var x,y;
                                after = $("#page-wrapper").attr("data-id");
                                $.getJSON("update.json?after=" + after, function(data){
                                    if(data['id']!=-1) {
                                      console.log(after)
                                      console.log(data)
                                      x = (new Date()).getTime(); 
                                      // x = data['read_time']; 
                                      y = data['mass_value'];
                                      series.addPoint([x, y], true, true);
                                      $("#measurements_count").text(data['measurements_count'])
                                      $("#containers_count").text(data['containers_count'])
                                      $("#containers_total_milk").text(data['containers_total_milk'])
                                      $("#time_ago").text(data['time_ago'])
                                      $("#page-wrapper").attr("data-id",data['id']);
                                    }
                                    else {
                                      console.log("Skipped: "+after)
                                    }
                                });
                            setTimeout(updateChartData,1000);  
                          }
                    }
              }
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
                plotLines: [{
                    width: 100
                }]
            },
            tooltip: {
                formatter: function() {
                        return this.series.name +': <b>'+this.y+' ml</b><br/>'+
                        Highcharts.dateFormat('%b. %e, %I:%M %p', this.x);
                }
            },
            
            series: [{
                name: 'Milk Amount',
                data: (function() {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i;
    
                    for (i = -19; i <= 0; i++) {
                        data.push({
                            x: time + i * 1000,
                            y: 0
                        });
                    }
                    return data;
                })()
            }]
        });
});



