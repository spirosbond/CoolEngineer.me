<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 15/03/20
  Time: 01:42
--%>

<g:each in="${appUser?.educationList}" var="educationItem" status="i">
    <g:form class="col s12 m6 l4" resource="${educationItem}" controller="education" action="updateSilent" method="PUT">
        <div class="card">
            <div class="card-image">
                <span class="my-handle"><i class="material-icons white-text">drag_handle</i></span>
                <span class="my-delete"><a href="<g:createLink controller="education" action="deleteSilent" id="${educationItem?.id}" params="[tabId: '#tab3']"/>"><i
                        class="material-icons white-text">delete</i></a></span>
                <asset:image src="education-card.jpg"/>
                <span class="card-title input-field">
                    <input id="education-name-${i}" name="name" required type="text" value="${educationItem?.name}" class="white-text validate">
                </span>
                <button id="education-save-${i}" class="btn-floating halfway-fab waves-effect waves-light hide ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                    <i class="material-icons">save</i>
                    <div class="ld ld-ring ld-spin"></div>
                </button>

            </div>

            <div class="card-content">
                <div class="input-field">
                    <input id="education-sector-${i}" name="sector" required type="text" value="${educationItem?.sector}" class="validate">
                    <label for="education-sector-${i}">Sector</label>
                </div>

                <div class="input-field">
                    <i class="material-icons prefix">date_range</i>
                    <input id="education-startDate-${i}" name="startDate" required type="date" value="${educationItem?.startDate?.toString()?.substring(0,10)}" class="validate">
                    <label for="education-startDate-${i}">Start Date</label>
                </div>

                <label>
                    <g:checkBox id="education-current-${i}" name="current" value="${educationItem?.current}" onclick="checkboxClicked(this.id, 'education-endDate-${i}')"/>
                    <span>Current</span>
                </label>

                <div class="input-field">
                    <i class="material-icons prefix">date_range</i>
                    <input id="education-endDate-${i}" name="endDate" type="date" value="${educationItem?.endDate?.toString()?.substring(0,10)}" class="validate">
                    <label for="education-endDate-${i}">End Date</label>
                </div>

                <div class="input-field hidden">
                    <input name="tabId" type="hidden" value="#tab3">
                </div>

            </div>

        </div>
        <g:javascript>
                if (document.getElementById("education-current-${i}").checked) {
                    document.getElementById("education-endDate-${i}").disabled = true;
                } else {
                    document.getElementById("education-endDate-${i}").disabled = false;
                }

                document.addEventListener('DOMContentLoaded', function(){
                    document.getElementById("education-name-${i}").addEventListener('input', (event) => {
                        document.getElementById("education-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("education-sector-${i}").addEventListener('input', (event) => {
                        document.getElementById("education-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("education-startDate-${i}").addEventListener('change', (event) => {
                        document.getElementById("education-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("education-current-${i}").addEventListener('input', (event) => {
                        document.getElementById("education-save-${i}").classList.remove("hide");
                    });
                    document.getElementById("education-endDate-${i}").addEventListener('change', (event) => {
                        document.getElementById("education-save-${i}").classList.remove("hide");
                    });
                }, false);

        </g:javascript>

    </g:form>
</g:each>




