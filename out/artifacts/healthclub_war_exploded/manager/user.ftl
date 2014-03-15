<div id="age" style="min-width:550px;height:400px"></div>
<div id="gender" style="min-width:550px;height:400px"></div>
<div id="status" style="min-width:550px;height:400px"></div>
<script type="text/javascript">
    $(function () {
        Highcharts.setOptions({
            chart: {
                backgroundColor: {
                    linearGradient: [0, 0, 500, 500],
                    stops: [
                        [0, 'rgb(255, 255, 255)'],
                        [1, 'rgb(240, 240, 255)']
                    ]
                },
                borderWidth: 2,
                plotBackgroundColor: 'rgba(255, 255, 255, .9)',
                plotShadow: true,
                plotBorderWidth: 1
            }
        });


        $.get("/manager/age", function (result) {
            var age_data = [];
            for (var r in result) {
                age_data.push([r, result[r]]);
            }
            $('#age').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: true
                },
                title: {
                    text: '用户年龄分布情况'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [
                    {
                        type: 'pie',
                        name: '年龄段',
                        data: age_data
                    }
                ]
            });
        }, "json");

        $.get("/manager/gender", function (result) {
            $('#gender').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: '加入俱乐部的男女分布情况'
                },
                xAxis: {
                    categories: ['未设定', '男', '女']
                },
                credits: {
                    enabled: false
                },
                series: [
                    {
                        name: '性别',
                        data: [result[0], result[1], result[2]]
                    }
                ]
            });
        }, "json");

        $.get('/manager/status', function (result) {
            var status_date = [];
            for (var s in result) {
                status_date.push([result[s]['status'], result[s]['status_count']]);
            }
            console.log(status_date);
            $('#status').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: '用户状态'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: false
                        },
                        showInLegend: true
                    }
                },
                series: [
                    {
                        type: 'pie',
                        name: '用户状态',
                        data: status_date
                    }
                ]
            });
        }, "json");
    })
</script>