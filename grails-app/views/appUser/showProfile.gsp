<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Cool Engineer</title>
</head>

<body>
<g:render template="/layouts/navbar-dropdown" model="[activeId: 'nav-my-profile']"/>

<div class="section white">
    <div class="row container">
        <h2 class="header">My Profile</h2>

        <div class="card">
%{--            <div class="card-content">--}%
%{--                <span class="card-title">Logged in as: ${this.appUser?.user?.username}</span>--}%
%{--            </div>--}%

            <div class="card-tabs">
                <ul class="tabs tabs-fixed-width">
                    <li class="tab"><a href="#tab1">Profile</a></li>
                    <li class="tab"><a href="#tab2">Personal</a></li>
                    <li class="tab"><a href="#tab3">Career</a></li>
                    <li class="tab"><a href="#tab4">Skills</a></li>
                    <li class="tab"><a href="#tab5">Themes</a></li>
                </ul>
            </div>

            <div class="card-content grey lighten-4">
                <div id="tab1">
                    <div class="row">
                        <div class="col s12 m3">
                            <g:uploadForm name="uploadFeaturedImage" controller="appUser" action="uploadFeaturedImage">
                                <g:hiddenField name="id" value="${this.appUser?.id}"/>
                                <g:hiddenField name="version" value="${this.appUser?.version}"/>

                                <a>

                                    <button id="featuredImageFileSaveBtn" class="btn-floating waves-effect waves-light hide ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                                        <i class="material-icons">save</i>
                                        <div class="ld ld-ring ld-spin"></div>
                                    </button>

                                    <div class="file-field">
                                        <img id="featuredImageFile" class="circle" width="100%" style="object-fit: cover"
                                             src="<g:createLink controller="appUser" action="featuredImage" id="${this.appUser?.id}"/>" alt="${this.appUser?.user?.username}"/>
                                        <input id="featuredImageFileInput" type="file" name="featuredImageFile" accept=".jpg, .jpeg, .png"/>

                                    </div>

                                </a>

                            </g:uploadForm>
                        </div>

                        <div class="col s12 m9">
                            <g:form resource="${this.appUser}" action="updateSilent" method="PUT">

                                <g:include controller="appUser" action="getProfileInputFields" params="[appUser: appUser]"/>

                                <div class="input-field hidden">
                                    <input name="tabId" type="hidden" value="#tab1">
                                </div>

                                <button class="btn-small waves-effect waves-light right ld-over-inverse" onclick="submitElementClicked = this" type="submit">Update Profile
                                    <i class="material-icons right">edit</i>
                                    <div class="ld ld-ring ld-spin"></div>
                                </button>
                            </g:form>
                        </div>
                    </div>
                </div>

                <div id="tab2">
                    <div class="row">
                        <g:form class="col s12" resource="${this.appUser}" action="updateSilent" method="PUT">

                            <g:include controller="appUser" action="getPersonalInputFields" params="[appUser: appUser]"/>


                            <div class="input-field hidden">
                                <input name="tabId" type="hidden" value="#tab2">
                            </div>

                            <button class="btn-small waves-effect waves-light right ld-over-inverse" onclick="submitElementClicked = this" type="submit">Update Profile
                                <i class="material-icons right">edit</i>
                                <div class="ld ld-ring ld-spin"></div>
                            </button>
                        </g:form>

                    </div>
                </div>

                <div id="tab3">
                    <div class="section">
                        <h4>Education</h4>

                        <div class="divider"></div>

                        <div class="row">
                            <div id="educationList">
                                <g:include controller="appUser" action="getEducationList" params="[appUser: appUser]"/>
                            </div>
                            <g:include controller="education" action="createCard" params="[appUser: appUser]"/>
                        </div>
                    </div>

                    <div class="divider"></div>

                    <div class="section">
                        <h4>Work Experience</h4>

                        <div class="divider"></div>

                        <div class="row">
                            <div id="workExpList">
                                <g:include controller="appUser" action="getWorkExpList" params="[appUser: appUser]"/>
                            </div>
                            <g:include controller="workExp" action="createCard" params="[appUser: appUser]"/>
                        </div>
                    </div>

                    <div class="divider"></div>

                </div>

                <div id="tab4">
                    <div class="row">
                        <h4>Skills & Hobbies</h4>

                        <div id="skillCategoryList">
                            <g:include controller="appUser" action="getSkillList" params="[appUser: appUser]"/>
                        </div>
                        <g:include controller="skillCategory" action="createCollection" params="[appUser: appUser]"/>
                    </div>
                </div>

                <div id="tab5">
                    <div class="row">
                        <h4>Choose your Theme</h4>

                        <div id="resumeThemeList">
                            <g:include controller="resumeTheme" action="getResumeThemeList" params="[active: true, max: 20, sort: 'dateCreated', order: 'desc']"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="parallax-container">
    <div class="parallax"><asset:image src="appUser-showProfile-parallax-image-bottom.jpg"/></div>
</div>

<content tag="foot-scripts">
    <g:javascript>

            $("#featuredImageFileInput").change(function () {
                readURL('featuredImageFile', this);
                document.getElementById("featuredImageFileSaveBtn").classList.remove("hide");

            });
            $(document).ready(function () {
                document.getElementById('featuredImageFile').addEventListener('load', function() {
                    this.css({'height': this.width() + 'px'});
                });
            });

            Sortable.create(document.getElementById('educationList'), {
                animation: 150,
                handle: ".my-handle",
                onEnd: function (evt) {
                    $.ajax({
                        url:"${createLink(controller: 'appUser', action: 'updateEducationList')}",
                        data: {oldIndex: evt.oldIndex, newIndex:evt.newIndex, id: ${appUser?.id}},
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

            Sortable.create(document.getElementById('workExpList'), {
                animation: 150,
                handle: ".my-handle",
                onEnd: function (evt) {
                    $.ajax({
                        url:"${createLink(controller: 'appUser', action: 'updateWorkExpList')}",
                        data: {oldIndex: evt.oldIndex, newIndex:evt.newIndex, id: ${appUser?.id}},
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

            Sortable.create(document.getElementById('skillCategoryList'), {
                animation: 150,
                handle: ".my-handle",
                onEnd: function (evt) {
                    $.ajax({
                        url:"${createLink(controller: 'appUser', action: 'updateSkillCategoryList')}",
                        data: {oldIndex: evt.oldIndex, newIndex:evt.newIndex, id: ${appUser?.id}},
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
</content>

</body>
</html>