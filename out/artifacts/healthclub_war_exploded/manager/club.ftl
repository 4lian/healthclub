<div id="daily-man" style="min-width:550px;height:400px"></div>
<div id="month-man" style="min-width:550px;height:400px"></div>
<script type="text/javascript">
    $(function () {
        $.get("/manager/dailyMan", function (result) {
            var days = [];
            for (var i = 1; i <= 30; ++i) {
                days.push(i);
            }
            $('#daily-man').highcharts({
                title: {
                    text: '30内每天的用户',
                    x: -20 //center
                },
                subtitle: {
                    text: '显示的是今天为止的30天',
                    x: -20
                },
                xAxis: {
                    categories: days
                },
                yAxis: {
                    title: {
                        text: '次数（个）'
                    },
                    plotLines: [
                        {
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }
                    ]
                },
                tooltip: {
                    valueSuffix: '次'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [
                    {
                        name: '使用次数',
                        data: [7, 6, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9, 7, 6, 9, 14, 7, 6, 9, 14, 18, 21, 25, 26, 23, 18, 13, 9, 7, 6]
                    }
                ]
            });
        }, "json");

        $.get("/manager/monthMan", function (result) {
            $('#month-man').highcharts({
                title: {
                    text: '12个月的用户',
                    x: -20 //center
                },
                subtitle: {
                    text: '显示的是这个月为止的12月',
                    x: -20
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: '次数（个）'
                    },
                    plotLines: [
                        {
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }
                    ]
                },
                tooltip: {
                    valueSuffix: '次'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [
                    {
                        name: '使用次数',
                        data: [112, 134, 189, 120, 97, 167, 190, 265, 123, 98, 146, 89]
                    }
                ]
            });
        }, "json");
    });
</script>