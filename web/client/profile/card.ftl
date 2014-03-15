<table id="univer-table">
    <thead>
    <tr>
        <th>会员卡</th>
        <th>类型</th>
    </tr>
    </thead>
    <tbody>
    <#list cardList as card>
    <tr>
        <td>${card.card_id}</td>
        <td>${card.type}</td>
    </tr>
    </#list>
    </tbody>
</table>
<script type="application/javascript">
    $(function () {
        $("#univer-table").dataTable();
    })
</script>