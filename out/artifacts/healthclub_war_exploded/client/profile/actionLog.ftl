<table id="univer-table">
    <thead>
    <tr>
        <th>参加时间</th>
        <th>活动ID</th>
        <th>活动名</th>
        <th>活动开始时间</th>
        <th>活动结束时间</th>
    </tr>
    </thead>
    <tbody>
    <#list actionLogList as actionLog>
    <tr>
        <td>${actionLog.invove_time}</td>
        <td>${actionLog.doing_id}</td>
        <td>${actionLog.name}</td>
        <td>${actionLog.start_time}</td>
        <td>${actionLog.end_time}</td>
    </tr>
    </#list>
    </tbody>
</table>
<script type="application/javascript">
    $(function(){
        $("#univer-table").dataTable();
    })
</script>