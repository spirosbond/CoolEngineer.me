<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 8/2/20
  Time: 9:53 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:render template="/layouts/ganalytics"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <title><g:layoutTitle default="CoolEngineer.me"/></title>
    <g:layoutHead/>

</head>

<body>
<g:layoutBody/>

<!-- Custom placeholder for page scripts -->
<g:ifPageProperty name="page.foot-scripts">
    <g:pageProperty name="page.foot-scripts"/>
</g:ifPageProperty>
</body>
</html>