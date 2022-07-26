<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
</head>
<body>
<div class="container-md w-75" style="margin:50px auto">
    <div class="row">
        <div class="col-md-2">
            <label for="tstart" class="form-check-label">출발지 터미널</label>
            <select name="depTerminalId" id="tstart" class="form-select">

            </select>
        </div>
        <div class="col-md-2">
            <label for="tend" class="form-check-label">목적지 터미널</label>
            <select name="arrTerminalId" id="tend" class="form-select">

            </select>
        </div>
        <div class="col-md-2">
            <label for="date" class="form-check-label">출발날짜</label>
            <input type="date" name="depPlandTime" id="date" class="form-control">
        </div>
        <div class="col-md-2">
            <label for="busGradeId" class="form-check-label">버스등급</label>
            <select name="busGradeId" id="busGradeId" class="form-select">
                <option value="1" selected>우등</option>
                <option value="2">고속</option>
                <option value="3">심야우등</option>
                <option value="4">심야고속</option>
                <option value="5">일반</option>
                <option value="6">일반심야</option>
                <option value="7">프리미엄</option>
                <option value="8">심야프리미엄</option>
            </select>
        </div>
        <div class="col-md-2">
            <br>
            <a href="javascript:ReqBusInfo()" class="btn btn-primary">조회</a>
        </div>
    </div>
    <div class="row">
        <table id="resulttbl" class="table table-striped"></table>
    </div>
</div>
<script>
    $.ajax({
        type: "GET", dataType: "json", url: "/ShowBus.Info", contentType: "application/json", success: function(result)
        {
            // $.each(result, function(k1, v1)
            // {
            //     $.each(v1, function(k2, v2)
            //     {
            //         if(k2 === "body")
            //         {
            //             $.each(v2, function(k3, v3)
            //             {
            //                 if(k3 === "items")
            //                 {
            //                     $.each(v3, function(k4, v4)
            //                     {
            //                         for(let i = 0; i < v4.length; i++)
            //                         {
            //                             document.write(v4[i].terminalNm + " " + v4[i].terminalId + "<br>");
            //                         }
            //                     });
            //                 }
            //             });
            //         }
            //     });
            // })
            bodylist = result["response"]["body"]["items"]["item"];
            for(let i = 0; i < bodylist.length; i++)
            {
                $('#tstart').append("<option value=" + bodylist[i].terminalId + ">" + bodylist[i].terminalNm + "</option>");
                $('#tend').append("<option value=" + bodylist[i].terminalId + ">" + bodylist[i].terminalNm + "</option>");
            }
        }, error: function(request, status, error)
        {
            alert("에러");
        }
    })

    function ReqBusInfo()
    {
        $.ajax({
            type: "GET", dataType: "json", url: "/ReqBus.Info", data: {
                "depTerminalId": $("#tstart").val(),
                "arrTerminalId": $("#tend").val(),
                "depPlandTime": $("#date").val(),
                "busGradeId": $("#busGradeId").val()
            }, contentType: "application/json", success: function(result)
            {
                $('#resulttbl').children().remove();

                bodylist = result["response"]["body"]["items"]["item"];
                str = "<tr>"
                str += "<th>출발지터미널</th>"
                str += "<th>목적지터미널</th>"
                str += "<th>출발시간</th>"
                str += "<th>도착시간</th>"
                str += "<th>이용요금</th>"
                str += "</tr>"

                for(let i = 0; i < bodylist.length; i++)
                {
                    str += "<tr>"
                    str += "<td>" + bodylist[i].depPlaceNm + "</td>"
                    str += "<td>" + bodylist[i].arrPlaceNm + "</td>"
                    str += "<td>" + bodylist[i].depPlandTime + "</td>"
                    str += "<td>" + bodylist[i].arrPlandTime + "</td>"
                    str += "<td>" + bodylist[i].charge + "</td>"
                    str += "</tr>"
                }
                $('#resulttbl').append(str);
            }, error: function()
            {
                alert("에러2");
            }
        })
    }
</script>
</body>
</html>
