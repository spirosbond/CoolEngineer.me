<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Cool Engineer</title>
</head>

<body>

<g:render template="/layouts/navbar-dropdown" model="[activeId: 'nav-login']"/>

%{--<g:form controller="login" action="authenticate" method="POST">--}%
<g:form controller="security" action="auth" method="POST">

    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title">Login</span>

                        <g:render template="/layouts/login_inputfields" model="['source_id':'auth-form']"/>

                    </div>

                    <div class="card-action">

                        <g:render template="/layouts/login_actionbuttons" model="['source_id':'login-modal']"/>

                    </div>

                </div>
            </div>
        </div>
    </div>
</g:form>

</body>
</html>
