<table id="univer-table">
    <thead>
    <tr>
        <th>银行卡</th>
        <th>付费类型</th>
        <th>付费时间</th>
        <th>付费金额</th>
        <th>备注</th>
    </tr>
    </thead>
    <tbody>
    <#list payLogList as payLog>
    <tr>
        <td>${payLog.brank_card_id}</td>
        <td>${payLog.pay_type}</td>
        <td>${payLog.pay_time}</td>
        <td>${payLog.count}</td>
        <td>${payLog.message!}</td>
    </tr>
    </#list>
    </tbody>
</table>
<script type="application/javascript">
    $(function(){
        $("#univer-table").dataTable();
    })
</script>