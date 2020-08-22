<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="grails_main"/>
    <g:set var="entityName" value="${message(code: 'appUser.label', default: 'AppUser')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-appUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/grails_index')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-appUser" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <f:table collection="${appUserList}"/>

    <div class="pagination">
        <g:paginate total="${appUserCount ?: 0}"/>
    </div>
</div>
</body>
</html>