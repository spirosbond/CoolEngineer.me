<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 19/03/20
  Time: 23:15
--%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="renderTheme"/>
    <title>Themes</title>
</head>

<body>

<g:render template="/layouts/navbar-render-theme" model="[appUser: appUser]"/>

<g:include view="${this.resumeThemePath}"/>

</body>
</html>