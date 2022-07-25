<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
</head>
<body>
<script>
    $.ajax({
        type: "GET", dataType: "json", url: "/ShowBus.Info", contentType: "application/json", success: function(result)
        {
            $.each(result, function(k1, v1)
            {
                $.each(v1, function(k2, v2)
                {
                    if(k2 === "body")
                    {
                        $.each(v2, function(k3, v3)
                        {
                            if(k3 === "items")
                            {
                                $.each(v3, function(k4, v4)
                                {
                                    for(let i = 0; i < v4.length; i++)
                                    {
                                        document.write(v4[i].terminalNm + " " + v4[i].terminalId + "<br>");
                                    }
                                });
                            }
                        });
                    }
                });
            })
        }, error: function(request, status, error)
        {

        }
    })
</script>
</body>
</html>
