<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 18/03/20
  Time: 00:59
--%>

<div class="row">

    <div class="input-field col s12 m6">
        <i class="material-icons prefix">date_range</i>
        <input id="dateOfBirth" name="dateOfBirth" required type="text" value="${appUser?.dateOfBirth}" class="datepicker validate birthday">
        <label for="dateOfBirth">Birthdate (yyyy-mm-dd)</label>
    </div>

    <div class="input-field col s12 m6">
        <i class="material-icons prefix">phone</i>
        <input id="phoneNumber" name="phoneNumber" type="tel" class="validate" value="${appUser?.phoneNumber}">
        <label for="phoneNumber">Phone Number (optional)</label>
    </div>
</div>

<div class="row">
    <div class="input-field col s12">
        <i class="material-icons prefix">home</i>
        <input id="address" name="address" type="text" value="${appUser?.address}" class="validate">
        <label for="address">Address (optional)</label>
    </div>
</div>

<div class="row">
    <div class="input-field col s12">
        <i class="material-icons prefix">link</i>
        <input id="url" name="url" type="text" value="${appUser?.url}" class="validate">
        <label for="url">Personal Website (optional)</label>
    </div>
</div>

<div class="row">
    <div class="input-field col s12 l6">
        <input id="headline" name="headline" type="text" class="character-counter" data-length="50" value="${appUser?.headline}">
        <label for="headline">Headline (optional)</label>
        <span class="helper-text" data-error="Must be less than 50 characters" data-success=""></span>
    </div>
</div>

<div class="row">
    <div class="input-field col s12">
        <textarea id="aboutMe" name="aboutMe" class="materialize-textarea character-counter" data-length="150">${appUser?.aboutMe}</textarea>
        <label for="aboutMe">About Me (optional)</label>
        <span class="helper-text" data-error="Must be less than 150 characters" data-success=""></span>
    </div>
</div>