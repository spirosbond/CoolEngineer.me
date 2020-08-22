<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 16/03/20
  Time: 01:32
--%>

<div class="row">
    <ul class="collection with-header">

        <li class="collection-header">
            <g:form resource="${this.skillCategory}" controller="skillCategory" action="saveSilent" method="POST">
                <div class="row">
                    <div class="input-field col s9">
                        <i class="material-icons prefix">group_work</i>
                        <input id="skillCategory-name-new" name="skillCategoryName" required type="text" class="validate">
                        <label for="skillCategory-name-new">Category Name</label>
                    </div>

                    <div class="col s2">
                        <button class="btn-small waves-effect waves-light red right ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                            <i class="material-icons">add</i>
                            <div class="ld ld-ring ld-spin"></div>
                        </button>
                    </div>

                    <div class="input-field hidden">
                        <input id="skillCategory-appUser-new" name="appUser" type="hidden" value="${appUser.id}">
                    </div>

                    <div class="input-field hidden">
                        <input name="tabId" type="hidden" value="#tab4">
                    </div>

                </div>
            </g:form>

        </li>

        </ul>

</div>