<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 15/03/20
  Time: 03:57
--%>
<g:form class="col s12 m6 l4" resource="${this.education}" controller="education" action="saveSilent" method="POST">
    <div class="card">
        <div class="card-image">
            <asset:image src="education-card-new.jpg"/>
            <span class="card-title input-field">
                <input id="education-name-new" name="name" required type="text" class="white-text validate" placeholder="Name">
            </span>
            <button class="btn-floating halfway-fab waves-effect waves-light red ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                <i class="material-icons">add</i>
                <div class="ld ld-ring ld-spin"></div>
            </button>
        </div>

        <div class="card-content">
            <div class="input-field">
                <input id="education-sector-new" name="sector" required type="text" class="validate">
                <label for="education-sector-new">Sector</label>
            </div>

            <div class="input-field">
                <i class="material-icons prefix">date_range</i>
                <input id="education-startDate-new" name="startDate" required type="date" class="validate">
                <label for="education-startDate-new">Start Date</label>
            </div>

            <label>
                <g:checkBox id="educationItem-current-new" name="current" onclick="checkboxClicked(this.id, 'education-endDate-new')"/>
                <span>Current</span>
            </label>

            <div class="input-field">
                <i class="material-icons prefix">date_range</i>
                <input id="education-endDate-new" name="endDate" type="date" class="validate">
                <label for="education-endDate-new">End Date</label>
            </div>

            <div class="input-field hidden">
                <input id="education-appUser" name="appUser" type="hidden" value="${appUser.id}">
            </div>

            <div class="input-field hidden">
                <input name="tabId" type="hidden" value="#tab3">
            </div>

        </div>

    </div>

</g:form>
