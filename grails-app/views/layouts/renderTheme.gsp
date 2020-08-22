<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 5/24/20
  Time: 1:10 PM
--%>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Themes"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="fonts.css"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="render_theme.css"/>
    <asset:javascript src="meerkatutils.js"/>
    <asset:javascript src="spinner.js"/>

    <g:render template="/layouts/ganalytics"/>

    <g:layoutHead/>

</head>

<body>

<g:ifPageProperty name="page.nav-render-theme">
    <g:pageProperty name="page.nav-render-theme"/>
</g:ifPageProperty>

<g:layoutBody/>

%{--<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>--}%

<!-- Custom placeholder for page scripts -->
<g:ifPageProperty name="page.foot-scripts">
    <g:pageProperty name="page.foot-scripts"/>
</g:ifPageProperty>

</body>
</html>