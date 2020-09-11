<div id="login" class="modal">
    <div class="modal-content">
        <h4>Login</h4>
%{--        <g:form controller="login" action="authenticate" method="POST">--}%
        <g:form controller="security" action="auth" method="POST">

            <g:render template="/layouts/login_inputfields" model="['source_id':'login-modal']"/>

            <div class="modal-footer">
                <g:link class="waves-effect btn-flat blue-grey-text text-lighten-1 left" controller="appUser" action="showRegister">Sign Up</g:link>
                <button type="submit" class="waves-effect waves-green btn right ld-over-inverse" onclick="submitElementClicked = this">
                    Login
                    <div class="ld ld-ring ld-spin"></div>
                </button>
            </div>
        </g:form>

    </div>
</div>
