<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 15/03/20
  Time: 03:57
--%>
<g:form class="col s12 m6 l4" resource="${this.workExp}" controller="workExp" action="saveSilent" method="POST">
    <div class="card">
        <div class="card-image">
            <asset:image src="workExp-card-new.jpg"/>
            <span class="card-title input-field">
                <input id="workExp-title-new" name="title" required type="text" class="white-text validate" placeholder="Job Title">
            </span>
            <button class="btn-floating halfway-fab waves-effect waves-light red ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                <i class="material-icons">add</i>
                <div class="ld ld-ring ld-spin"></div>
            </button>

        </div>

        <div class="card-content">

            <div class="input-field">
                <input id="workExp-employerName-new" name="employerName" required type="text" class="validate">
                <label for="workExp-employerName-new">Employer</label>
            </div>

            <div class="input-field">
                <input id="workExp-location-new" name="location" required type="text" class="validate">
                <label for="workExp-location-new">Location</label>
            </div>

            <div class="input-field">
%{--                <input id="workExp-description-new" name="description" required type="text" class="validate">--}%
                <textarea id="workExp-description-new" name="description" required type="text" class="materialize-textarea validate"></textarea>
                <label for="workExp-description-new">Description</label>
            </div>

            <div class="input-field">
                <i class="material-icons prefix">date_range</i>
                <input id="workExp-startDate" name="startDate" required type="date" class="validate">
                <label for="workExp-startDate">Start Date</label>
            </div>

            <label>
                <g:checkBox id="workExp-current-new" name="current" onclick="checkboxClicked(this.id, 'workExp-endDate-new')"/>
                <span>Current</span>
            </label>

            <div class="input-field">
                <i class="material-icons prefix">date_range</i>
                <input id="workExp-endDate-new" name="endDate" type="date" class="validate">
                <label for="workExp-endDate-new">End Date</label>
            </div>

            <div class="input-field hidden">
                <input id="workExp-appUser" name="appUser" type="hidden" value="${appUser.id}">
            </div>

            <div class="input-field hidden">
                <input name="tabId" type="hidden" value="#tab3">
            </div>

        </div>

    </div>

</g:form>
