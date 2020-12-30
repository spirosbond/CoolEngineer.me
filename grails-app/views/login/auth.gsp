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
                        <g:link class="waves-effect btn-flat blue-grey-text text-lighten-1" controller="appUser" action="showRegister">Sign Up</g:link>
                        <g:link class="waves-effect btn-flat blue-grey-text text-lighten-1" controller="register" action="forgotPassword">Password Reset</g:link>
                        <button type="submit" class="waves-effect waves-green btn right ld-over-inverse" onclick="submitElementClicked = this">
                            Login
                            <div class="ld ld-ring ld-spin"></div>
                        </button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</g:form>

</body>
</html>