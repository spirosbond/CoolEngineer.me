<g:applyLayout name="main">

    <content tag="title"><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></content>
    <head>
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <g:render template="/layouts/navbar-dropdown"/>

    <g:if env="development">
        <g:if test="${Throwable.isInstance(exception)}">
            <g:renderException exception="${exception}"/>
        </g:if>
        <g:elseif test="${request.getAttribute('javax.servlet.error.exception')}">
            <g:renderException exception="${request.getAttribute('javax.servlet.error.exception')}"/>
        </g:elseif>
        <g:else>
            <ul class="errors">
                <li>An error has occurred</li>
                <li>Exception: ${exception}</li>
                <li>Message: ${message}</li>
                <li>Path: ${path}</li>
            </ul>
        </g:else>
    </g:if>
    <g:else>
        <div class="container-fluid">
            <div class="row center">
                <asset:image src="500-internal-server-error.png" width="70%"/>
            </div>
        </div>
    </g:else>

</g:applyLayout>