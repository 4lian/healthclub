<div style="width:500px;margin: 0 auto" id="add-action">
    <form method="post" action="/waiter/addAction" class="form-horizontal" id="ajax-form">
        <div class="form-item">
            <label>活动名：</label>

            <div class="form-field">
                <input type="text" class="form-text" id="action_name" name="action_name"
                       placeholder="请输入活动名...">
            </div>
        </div>

        <div class="form-item">
            <label>活动场地：</label>

            <div class="form-field">
                <input type="text" class="form-text" id="action_address" name="action_address"
                       placeholder="请输入活动场地...">
            </div>
        </div>

        <div class="form-item">
            <label>描述：</label>

            <div class="form-field">
                <textarea type="text" class="form-text" id="action_desc" name="action_desc" placeholder="备注"></textarea>
            </div>
        </div>
        <div class="form-item">
            <label for="start_time">开始时间：</label>

            <div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z"
                 data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                <input class="form-control" size="16" type="text" value="" name="start_time" readonly="">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
            </div>
        </div>

        <div class="form-item">
            <label for="end_time">结束时间：</label>

            <div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z"
                 data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
                <input class="form-control" size="16" type="text" value="" name="end_time" readonly="">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
            </div>
        </div>

        <div class="form-action">
            <a class="btn btn-primary" href="#/" role="button submit">保存更改</a>
        </div>
    </form>
</div>
<table id="univer-table">
    <thead>
    <tr>
        <th>创建服务员</th>
        <th>活动ID</th>
        <th>活动名</th>
        <th>活动开始时间</th>
        <th>活动结束时间</th>
        <th>活动创建时间</th>
        <th>活动场地</th>
        <th>备注</th>
        <th>参加用户</th>
    </tr>
    </thead>
    <tbody>
    <#list actionList as action>
        <#assign action_id = action.id>
    <tr>
        <td>${action.waiter_id}</td>
        <td>${action_id}</td>
        <td>${action.doing_name!}</td>
        <td>${action.start_time!}</td>
        <td>${action.end_time!}</td>
        <td>${action.create_time!}</td>
        <td>${action.address!}</td>
        <td>${action.doing_desc!}</td>
        <td><a href="#/waiter/involveUser/${action_id}">查看</a></td>
    </tr>
    </#list>
    </tbody>
</table>


<script type="application/javascript">
    $(function () {
        $("#univer-table").dataTable({
            "iDisplayLength": 5
        });
        $('.form_datetime').datetimepicker({
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
    })
</script>