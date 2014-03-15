<table id="univer-table">
    <thead>
    <tr>
        <td>会员ID</td>
        <td>会员名</td>
        <td>参加时间</td>
        <td>删除</td>
    </tr>
    </thead>
    <tbody>
    <#list userList as user>
    <tr>
        <td>${user.user_id}</td>
        <td>${user.name}</td>
        <td>${user.invove_time}</td>
        <td><a href="#/waiter/deleteUserFromDoing/${user.doing_id}-${user.user_id}">删除</a></td>
    </tr>
    </#list>
    </tbody>
</table>
<script type="application/javascript">
    $(function(){
       $("#univer-table").dataTable();
    });
</script>