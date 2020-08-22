<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 18/03/20
  Time: 00:54
--%>

<div class="row">
    <div class="input-field col s12 m6">
        <i class="material-icons prefix">account_circle</i>
        <input id="name" name="name" required type="text" value="${appUser?.name}" class="validate">
        <label for="name">First Name</label>
    </div>

    <div class="input-field col s12 m6">
        <input id="surname" name="surname" required type="text" value="${appUser?.surname}" class="validate">
        <label for="surname">Last Name</label>
    </div>
</div>

<div class="row">
    <div class="input-field col s12">
        <i class="material-icons prefix">email</i>
        <input id="email" name="email" required type="email" value="${appUser?.email}" class="validate" pattern="[0-9a-zA-Z_\-]*@[0-9a-zA-Z_\-]*\.[0-9a-zA-Z_\-]*">
        <label for="email">Email</label>
        <span class="helper-text" data-error="Not a valid email address" data-success="right"></span>
    </div>
</div>