<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 15/03/20
  Time: 22:12
--%>

<g:each in="${appUser?.skillCategoryList}" var="skillCategoryItem" status="i">

    <div class="row">
        <span class="my-handle"><i class="material-icons">drag_handle</i></span>
        <span class="my-delete-extra-padding-right"><a href="<g:createLink controller="skillCategory" action="deleteSilent" id="${skillCategoryItem?.id}" params="[tabId: '#tab4']"/>"><i
                class="material-icons">delete</i></a></span>
        <ul class="collection with-header">
            <li class="collection-header">
                <g:form resource="${skillCategoryItem}" controller="skillCategory" action="updateSilent" method="PUT">
                    <div class="row">
                        <div class="input-field col s9">
                            <i class="material-icons prefix">group_work</i>
                            <input id="skillCategory-name-${i}" name="skillCategoryName" required type="text" value="${skillCategoryItem?.skillCategoryName}" class="validate">
                            <label for="skillCategory-name-${i}">Category Name</label>
                        </div>

                        <div class="col s2">
                            <button id="skillCategory-save-${i}" class="btn-small waves-effect waves-light red right hide ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                                <i class="material-icons">save</i>
                                <div class="ld ld-ring ld-spin"></div>
                            </button>
                        </div>

                        <div class="input-field hidden">
                            <input id="skillCategory-appUser-${i}" name="appUser" type="hidden" value="${skillCategoryItem?.appUser?.id}">
                        </div>

                        <div class="input-field hidden">
                            <input name="tabId" type="hidden" value="#tab4">
                        </div>

                    </div>
                </g:form>

            </li>

            <div id="skillList-${i}">

                <g:each in="${skillCategoryItem.skillList}" var="skillItem" status="j">
                    <div>
                        <g:form resource="${skillItem}" controller="skill" action="updateSilent" method="PUT">
                            <span class="my-delete"><a href="<g:createLink controller="skill" action="deleteSilent" id="${skillItem?.id}" params="[tabId: '#tab4']"/>"><i
                                    class="material-icons">delete</i></a></span>
                            <li class="row collection-item">
%{--<div class=" ">--}%
                                <div class="input-field col s12 m7">
                                    %{--                                <span class="my-subhandle"><i class="material-icons">drag_handle</i></span>--}%
                                    %{--                                <i class="material-icons prefix">star</i>--}%
                                    <i class="material-icons prefix my-subhandle my-subhandle-id-${i}">drag_handle</i>
                                    <input id="skill-name-${i}${j}" name="skillName" required type="text" value="${skillItem?.skillName}" class="validate">
                                    <label for="skill-name-${i}${j}">Skill Name</label>
                                    <span class="helper-text" data-error="" data-success=""></span>
                                </div>

                                <div class="input-field col s4 m2">
                                    <input id="skill-level-${i}${j}" name="level" required type="number" value="${skillItem?.level}" class="validate" min="1" max="5">
                                    <label for="skill-level-${i}${j}">Level</label>
                                    <span class="helper-text" data-error="Must be from 1 to 5" data-success=""></span>
                                </div>

                                <div class="col s2">
                                    <button id="skill-save-${i}${j}" class="btn-small waves-effect waves-light red right hide ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                                        <i class="material-icons">save</i>
                                        <div class="ld ld-ring ld-spin"></div>
                                    </button>
                                </div>
                                <div class="input-field hidden">
                                    <input id="skill-skillCategory-${i}${j}" name="skillCategory" type="hidden" value="${skillCategoryItem?.id}">
                                </div>

                                <div class="input-field hidden">
                                    <input name="tabId" type="hidden" value="#tab4">
                                </div>
%{--</div>--}%
                            </li>

                        </g:form>
                        <g:javascript>
                        document.addEventListener('DOMContentLoaded', function(){
                            document.getElementById("skill-name-${i}${j}").addEventListener('input', (event) => {
                                document.getElementById("skill-save-${i}${j}").classList.remove("hide");
                            });
                            document.getElementById("skill-level-${i}${j}").addEventListener('input', (event) => {
                                document.getElementById("skill-save-${i}${j}").classList.remove("hide");
                            });
                        }, false);
                        </g:javascript>
                    </div>
                </g:each>
            </div>

            <g:form resource="${this.skill}" controller="skill" action="saveSilent" method="POST">
                <li class="collection-item">
                    <div class="row">

                        <div class="input-field col s12 m7">
                            <i class="material-icons prefix">star_border</i>
                            <input id="skill-name-new-${i}" name="skillName" required type="text" class="validate">
                            <label for="skill-name-new-${i}">Skill Name</label>
                            <span class="helper-text" data-error="" data-success=""></span>
                        </div>

                        <div class="input-field col s4 m2">
                            <input id="skill-level-new-${i}" name="level" required type="number" class="validate" min="1" max="5">
                            <label for="skill-level-new-${i}">Level</label>
                            <span class="helper-text" data-error="Must be from 1 to 5" data-success=""></span>
                        </div>

                        <div class="col s2">
                            <button class="btn-small waves-effect waves-light red right ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                                <i class="material-icons">add</i>
                                <div class="ld ld-ring ld-spin"></div>
                            </button>
                        </div>

                        <div class="input-field hidden">
                            <input id="skill-skillCategory-${i}" name="skillCategory" type="hidden" value="${skillCategoryItem?.id}">
                        </div>

                        <div class="input-field hidden">
                            <input name="tabId" type="hidden" value="#tab4">
                        </div>

                    </div>
                </li>

            </g:form>

        </ul>
        <g:javascript>
        document.addEventListener('DOMContentLoaded', function(){
                    document.getElementById("skillCategory-name-${i}").addEventListener('input', (event) => {
                        document.getElementById("skillCategory-save-${i}").classList.remove("hide");
                    });
                }, false);

        Sortable.create(document.getElementById('skillList-${i}'), {
            animation: 150,
            handle: ".my-subhandle-id-${i}",
            onEnd: function (evt) {
                $.ajax({
                    url:"${createLink(controller: 'skillCategory', action: 'updateSkillList')}",
                    data: {oldIndex: evt.oldIndex, newIndex:evt.newIndex, id: ${skillCategoryItem?.id}},
                    method:"PUT",
                    success: function(resp){
                        if(resp !== 'success') M.toast({html: 'Something went wrong...', classes: 'rounded'});
                    },
                    fail: function(resp){
                        M.toast({html: 'Something went wrong...', classes: 'rounded'});
                    }
                });
            }
        });

        </g:javascript>
    </div>

</g:each>
