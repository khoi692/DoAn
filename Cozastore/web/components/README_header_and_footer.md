to use footer and header :
Step 1: Dowload footer.jsp and header.jsp then save both to Cozastore/web/components
Step 2: Dowload footer.css and header.css and save to Cozastore/web/css
Step 3: put these code in to whichever page you want header (and/or) footer to appear

<!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
<!------------------------------------------------------------------------->

<!------------------------------footer including--------------------------->
        <%@include file="components/footer.jsp"%>
<!------------------------------------------------------------------------->

Note : Header is on the top of the site so you must put the header include right below <body> tag
and footer include right above </body> end tag like this : 

<body>
    <!------------------------------header including--------------------------->
        <%@include file="components/header.jsp"%>
    <!------------------------------------------------------------------------->


       ==================== CONTENT OF THE PAGE HERE ======================


    <!------------------------------footer including--------------------------->
        <%@include file="components/footer.jsp"%>
    <!------------------------------------------------------------------------->
</body>
