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
    <g:render template="/layouts/favicon"/>
    <title><g:layoutTitle default="IsLinked.me"/></title>
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
