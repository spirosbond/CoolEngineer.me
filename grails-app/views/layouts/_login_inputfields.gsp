<div class="row">
    <div class="input-field col s12 m6">
        <i class="material-icons prefix">account_circle</i>
        <input id="username-${source_id}" type="text" name="username" class="validate text-lowercase" autocapitalize="off" oninput="this.value = this.value.toLowerCase();" required/>
        <label for="username-${source_id}">Username</label>
    </div>

    <div class="input-field col s12 m6">
        <i class="material-icons prefix">lock</i>
        <input id="password-${source_id}" type="password" name="password" class="validate" required/>
        <label for="password-${source_id}">Password</label>
    </div>
</div>