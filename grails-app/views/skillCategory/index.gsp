<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="grails_main" />
        <g:set var="entityName" value="${message(code: 'skillCategory.label', default: 'SkillCategory')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-skillCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/grails_index')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-skillCategory" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${skillCategoryList}" />

            <div class="pagination">
                <g:paginate total="${skillCategoryCount ?: 0}" />
            </div>
        </div>
    </body>
</html>