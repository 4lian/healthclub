<table>
    <thead>
    <tr>
        <td>会员ID</td>
        <td>会员名</td>
        <td>删除</td>
    </tr>
    </thead>
    <tbody>
    <#list userList as user>
    <tr>
        <td><a href="#/waiter/profile/${user.id}">${user.id}</a></td>
        <td>${user.name}</td>
        <td>
            <#if user.profile.isEnd()>
                <a href="#/waiter/activeUser/${user.id}">解冻</a>
            <#else>
                <a href="#/waiter/deleteUser/${user.id}">冻结</a>
            </#if>
        </td>
    </tr>
    </#list>
    </tbody>
</table>