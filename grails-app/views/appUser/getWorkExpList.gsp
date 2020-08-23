<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 15/03/20
  Time: 12:53
--%>

<g:each in="${appUser?.workExpList}" var="workExpItem" status="i">
    <g:form class="col s12 m6 l4" resource="${workExpItem}" controller="workExp" action="updateSilent" method="PUT">
        <div class="card">
            <div class="card-image">
                <span class="my-handle"><i class="material-icons white-text">drag_handle</i></span>
                <span class="my-delete"><a href="<g:createLink controller="workExp" action="deleteSilent" id="${workExpItem?.id}" params="[tabId: '#tab3']"/>"><i
                        class="material-icons white-text">delete</i></a></span>
                <asset:image src="workExp-card.jpg"/>
                <span class="card-title input-field">
                    <input id="workExp-title-${i}" name="title" required type="text" value="${workExpItem?.title}" class="white-text validate">
                </span>
                <button id="workExp-save-${i}" class="btn-floating halfway-fab waves-effect waves-light red hide ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                    <i class="material-icons">save</i>
                    <div class="ld ld-ring ld-spin"></div>
                </button>

            </div>

            <div class="card-content">

                <div class="input-field">
                    <input id="workExp-employerName-${i}" name="employerName" required type="text" value="${workExpItem?.employerName}" class="validate">
                    <label for="workExp-employerName-${i}">Employer</label>
                </div>

                <div class="input-field">
                    <input id="workExp-location-${i}" name="location" required type="text" value="${workExpItem?.location}" class="validate">
                    <label for="workExp-location-${i}">Location</label>
                </div>

                <div class="input-field">
%{--                    <input id="workExp-description-${i}" name="description" required type="text" value="${workExpItem?.description}" class="validate">--}%
                    <textarea id="workExp-description-${i}" name="description" required type="text" class="materialize-textarea validate">${workExpItem?.description}</textarea>
                    <label for="workExp-description-${i}">Description</label>
                </div>

                <div class="input-field">
                    <i class="material-icons prefix">date_range</i>
%{--                    <input id="workExp-startDate-${i}" name="startDate" required type="text" value="${workExpItem?.startDate}" class="datepicker validate pastday">--}%
                    <input id="workExp-startDate-${i}" name="startDate" required type="date" value="${workExpItem?.startDate?.toString()?.substring(0,10)}" class="validate">
                    <label for="workExp-startDate-${i}">Start Date</label>
                </div>

                <label>
                    <g:checkBox id="workExp-current-${i}" name="current" value="${workExpItem?.current}" onclick="checkboxClicked(this.id, 'workExp-endDate-${i}')"/>
                    <span>Current</span>
                </label>

                <div class="input-field">
                    <i class="material-icons prefix">date_range</i>
                    <input id="workExp-endDate-${i}" name="endDate" type="date" value="${workExpItem?.endDate?.toString()?.substring(0,10)}" class="validate">
                    <label for="workExp-endDate-${i}">End Date</label>
                </div>

                <div class="input-field hidden">
                    <input name="tabId" type="hidden" value="#tab3">
                </div>

            </div>

        </div>
        <g:javascript>
                if (document.getElementById("workExp-current-${i}").checked) {
                    document.getElementById("workExp-endDate-${i}").disabled = true;
                } else {
                    document.getElementById("workExp-endDate-${i}").disabled = false;
                }

                document.addEventListener('DOMContentLoaded', function(){
                    document.getElementById("workExp-title-${i}").addEventListener('input', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("workExp-employerName-${i}").addEventListener('input', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("workExp-location-${i}").addEventListener('input', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("workExp-description-${i}").addEventListener('input', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("workExp-startDate-${i}").addEventListener('change', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("workExp-current-${i}").addEventListener('input', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("workExp-endDate-${i}").addEventListener('change', (event) => {
                        document.getElementById("workExp-save-${i}").classList.remove("hide");
                    });
                }, false);

        </g:javascript>

    </g:form>
</g:each>

