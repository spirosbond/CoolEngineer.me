<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 5/22/20
  Time: 1:06 AM
--%>
%{--TODO: Allow to change username/password--}%
<div class="row">
    <div class="input-field col s12 m6">
        <i class="material-icons prefix">lock</i>
        <input placeholder="<username>.${grailsApplication?.config?.myserver?.url}" id="username-new"
               name="username" required type="text" class="validate" pattern="[0-9a-z_\-]{4,}">
        <label for="username-new">Username</label>
        <span class="helper-text" data-error="Only lowercase letters and numbers allowed. Minimum length is 4"
              data-success="Your personal resume will be here: <username>.${grailsApplication?.config?.myserver?.url}"></span>
    </div>

    <div class="input-field col s6 m3">
        <input id="password-new" name="password" required type="password" class="validate" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
        <label for="password-new">Password</label>
        <span class="helper-text" data-error="At least one number, one uppercase and one lowercase letter - min 8 characters"
              data-success="Secure"></span>
    </div>

    <div class="input-field col s6 m3">
        <input id="password-repeat-new" required type="password" class="validate">
        <label for="password-repeat-new">Repeat Password</label>
        <span class="helper-text" data-error="Passwords don't match"></span>
    </div>
</div>