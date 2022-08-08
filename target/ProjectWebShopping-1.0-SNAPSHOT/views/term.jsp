<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String index=(String)request.getAttribute("index");
    String content= (String) request.getAttribute("content");
%>
<link href="<%=request.getContextPath()%>/admin/css/bootstrapf9e3.css?v=1.1" rel="stylesheet" type="text/css"/>

    <div class="wrapper margin-top-mobile">
        <div class="menu__bar">
            <div>
                <H3 class="menu__bar-title" onclick="showMenu(this);"><span>THÔNG TIN
                    <div class="show-item"></div>
                </span>
                </H3>
            </div> <a href="<%=request.getContextPath()%>/term?index=1"><li class="menu__bar-list-item <%=(index.equals("1")?"select":"")%>" >Điều khoản sử dụng</li></a>
            <a href="<%=request.getContextPath()%>/term?index=2"><li class="menu__bar-list-item <%=(index.equals("2")?"select":"")%>">Hướng dẫn thanh toán</li></a>
            <a href="<%=request.getContextPath()%>/term?index=3"><li class="menu__bar-list-item <%=(index.equals("3")?"select":"")%>">Hướng dẫn mua hàng</li></a>
            <a href="<%=request.getContextPath()%>/term?index=4"><li class="menu__bar-list-item <%=(index.equals("4")?"select":"")%>">Chính sách vận chuyển</li></a>
            <a href="<%=request.getContextPath()%>/term?index=5"><li class="menu__bar-list-item <%=(index.equals("5")?"select":"")%>">Chính sách đổi trả</li></a>
            <a href="<%=request.getContextPath()%>/term?index=6"><li class="menu__bar-list-item <%=(index.equals("6")?"select":"")%>">Chính sách bán hàng và bảo hành</li></a>
            <a href="<%=request.getContextPath()%>/term?index=7"><li class="menu__bar-list-item <%=(index.equals("7")?"select":"")%>">Chính sách bảo mật</li></a>
            <a href="<%=request.getContextPath()%>/term?index=8"><li class="menu__bar-list-item <%=(index.equals("8")?"select":"")%>">Quyền lợi sinh nhật khách hàng</li></a>

            <div id="menu__bar-list">
                <div class="menu__content">
                <ul >
                             </ul>
            </div>
            </div>
        </div>
        <div class="content">
            <%=content%>
        </div>
    </div>
<style>
    p, a, h1, h2, h3,h4,h5,h6 {
        padding: 0;
        margin: 0;
        font-size: unset;
    }

</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css">
