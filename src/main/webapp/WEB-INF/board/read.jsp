<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/resources/includes/link.jsp" %>
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<%
    String msg = (String) request.getAttribute("MSG");
    if(msg != null)
    {
%>
<script>
    alert('<%=msg%>');
</script>
<%
    }
%>
<div class="container-md" id="wrapper" style="margin:100px auto;">
    <%--TopMenu--%>
    <%@ include file="/resources/includes/topmenu.jsp" %>
    <%--NAV--%>
    <%@ include file="/resources/includes/nav.jsp" %>
    <%--MainContents--%>
    <div id="maincontents" style="margin-top: 15px;">
        <%--Path--%>
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">자유게시판</a></li>
                <li class="breadcrumb-item active" aria-current="page">글내용</li>
            </ol>
        </nav>
    </div>
    <h1>글내용</h1>
    <%
        BoardDTO dto = (BoardDTO) request.getAttribute("dto");
        String nowPage = (String) request.getAttribute("nowPage");
        String[] filelist = null;
        String[] filesize = null;
        if(dto.getFilename() != null)
        {
            filelist = dto.getFilename().split(";");
            filesize = dto.getFilesize().split(";");
        }

        int np = Integer.parseInt(nowPage);
        int numPerPage = 10;
        int start = (np * numPerPage) - numPerPage;
        int end = np * numPerPage;
    %>
    <%--글수정 Modal--%>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel2" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel2">패스워드 확인</h5>
                </div>
                <form action="/Board/update.do" method="post" name="updatefrm">
                    <div class="modal-body">
                        <input type="password" class="form-control" name="pwd" placeholder="INSERT PASSWORD">
                        <input type="hidden" name="title">
                        <input type="hidden" name="content">
                        <input type="hidden" name="nowPage" value="<%=nowPage%>">
                    </div>
                </form>
                <script>
                    $(document).ready(function()
                    {
                        $('#updatebtn').on('click', function()
                        {
                            let form = document.updatefrm;
                            form.title.value = $('#title').val();
                            form.content.value = $('#content').val();
                            form.submit();
                        })
                    })
                </script>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="updatebtn">수정요청</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <%--글삭제 Modal--%>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel3" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel3">패스워드 확인</h5>
                </div>
                <form action="/Board/delete.do" method="post" name="deletefrm">
                    <div class="modal-body">
                        <input type="password" class="form-control" name="pwd" placeholder="INSERT PASSWORD">
                        <input type="hidden" name="nowPage" value="<%=nowPage%>">
                    </div>
                </form>
                <script>
                    $(document).ready(function()
                    {
                        $('#deletebtn').on('click', function()
                        {
                            let form = document.deletefrm;
                            form.submit();
                        })
                    })
                </script>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="deletebtn">삭제요청</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <form action="" method="post" enctype="multipart/form-data">
        <input name="title" id="title" class="form-control mb-3 w-50" value="<%=dto.getTitle()%>">
        <input name="writer" class="form-control mb-3 w-50" value="<%=dto.getWriter()%>">
        <textarea name="content" id="content" class="form-control mb-3 w-50"
                  style="height: 350px; resize: none;"><%=dto.getContent()%></textarea>
        <a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">글수정</a>
        <a href="/Board/list.do?nowPage=<%=nowPage%>&start=<%=start%>&end=<%=end%>" class="btn btn-secondary">리스트</a>
        <a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop3">글삭제</a>
        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
            첨부파일 보기
        </button>
    </form>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">첨부파일 리스트</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <%
                        if(filelist != null)
                        {
                            for(int i = 0; i < filelist.length; i++)
                            {

                                String tmpfilename = filelist[i].substring(0, filelist[i].lastIndexOf("_"));
                                tmpfilename += filelist[i].substring(filelist[i].lastIndexOf("."), filelist[i].length());

                                filelist[i] = URLEncoder.encode(filelist[i], "utf-8").replaceAll("\\+", "%20");
                                out.println("<a href=/Board/download.do?filename=" + filelist[i] + ">" + tmpfilename + "(" + filesize[i] + " byte)</a><br>");
                            }
                        }
                        else
                        {
                            out.println("파일없음");
                        }
                    %>
                </div>
                <div class="modal-footer">
                    <a id="downall" class="btn btn-primary" href="#">모두 받기</a>
                    <a class="btn btn-primary" href="/Board/downloadAll.do">모두 받기(zip)</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                </div>
                <%--다중파일 무압축 받기--%>
                <%
                    if(filelist != null)
                    {
                %>
                        <form name="multiform">
                            <%
                                for(String list : Objects.requireNonNull(filelist))
                                {
                                    out.println("<input type='hidden' name='file' value='" + list + "'>");
                                }
                            %>
                        </form>
                <%
                    }
                %>
                <script>
                    $(document).ready(function()
                    {
                        let form = document.multiform;
                        let iFrameCnt = 0;
                        $('#downall').click(function(event)
                        {
                            for(let i = 0; i < form.childElementCount; i++)
                            {
                                let fileName = form[i].value;
                                let url = "/Board/download.do?filename=" + fileName;
                                fnCreateIframe(iFrameCnt);
                                $('iframe[name=' + iFrameCnt + ']').attr("src", url);
                                iFrameCnt++;
                                fnSleep(1000);
                            }
                        });
                        fnCreateIframe = function(name)
                        {
                            let frm = $('<iframe name="' + name + '" style="display:none;"></iframe>');
                            frm.appendTo("body");
                        }
                        fnSleep = function(delay)
                        {
                            let start = new Date().getTime();
                            while(start + delay > new Date().getTime()) ;
                        }
                    })
                </script>
            </div>
        </div>
    </div>
</div>
<%--Footer--%>
<%--댓글남기기--%>
<div id="replycontainer" class="w-75" style="position: absolute; left:53%; top:37%;">
    <form>
        <div>
            <textarea id="comment" class="form-control mb-3 w-50" style="height:200px;"
                      placeholder="댓글을 입력해 주세요."></textarea>
            <input type="hidden" name="nowPage" value="<%=nowPage%>">
        </div>
        <div>
            <a href="javascript:postreply()" class="btn btn-secondary">댓글 남기기</a>
        </div>
    </form>
    <div class="mb-2" id="replycnt">
        댓글수 : <span>100</span>
    </div>
    <div style="overflow:auto; width:580px; height:300px; border:1px solid gray;" id="replylist">
        <%--댓글 리스트--%>
    </div>
</div>
<%--댓글 끝--%>
<script>
    function postreply()
    {
        // 댓글 등록
        $.ajax({
            url: '/Board/replypost.do',
            type: 'GET',
            data: {"comment": $('#comment').val(), "nowPage": <%=nowPage%>},
            error: function()
            {
                alert("에러");
            },
            success: function(result)
            {
                listreply();
                $('#comment').val("");
            }
        });
    }

    function listreply()
    {
        // 댓글 목록 가져오기
        $.ajax({
            url: '/Board/replylist.do', type: 'GET', error: function()
            {
                alert("에러");
            }, success: function(result)
            {
                $('#replylist').html(result);
                totalreplycnt();
            }
        });
    }
    listreply();

    function totalreplycnt()
    {
        // 댓글 수
        $.ajax({
            url: '/Board/replycnt.do', type: 'GET', error: function()
            {
                alert("에러");
            }, success: function(result)
            {
                $('#replycnt').html(result);
            }
        });
    }
</script>
</body>
</html>
