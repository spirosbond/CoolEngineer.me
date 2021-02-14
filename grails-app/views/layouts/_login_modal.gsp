<div id="login" class="modal">
    <div class="modal-content">
        <h4>Login</h4>
%{--        <g:form controller="login" action="authenticate" method="POST">--}%
        <g:form controller="security" action="auth" method="POST">

            <g:render template="/layouts/login_inputfields" model="['source_id':'login-modal']"/>

            <div class="modal-footer">

                <g:render template="/layouts/login_actionbuttons" model="['source_id':'login-modal']"/>

            </div>
        </g:form>

    </div>
</div>
