<%--
  Created by IntelliJ IDEA.
  User: spirosbond
  Date: 5/22/20
  Time: 6:27 PM
--%>

<g:each in="${resumeThemeList}" var="resumeThemeItem" status="i">
    <div class="col s12 m4 l3">
        <div class="card">
            <div class="card-image">
                <sec:ifLoggedIn>
                    <g:link controller="renderTheme" action="renderAppUserResume" id="${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.id}"
                            params="[themeId: resumeThemeItem.id]">
                        <asset:image class="hide-on-med-and-down" data-caption="'${resumeThemeItem.name}' Demo" width="200" height="300" src="${resumeThemeItem.previewImagePath}"/>
                        <asset:image class="hide-on-small-and-down hide-on-large-only" data-caption="'${resumeThemeItem.name}' Demo" width="300" height="330"
                                     src="${resumeThemeItem.previewImagePath}"/>
                        <asset:image class="hide-on-med-and-up" data-caption="'${resumeThemeItem.name}' Demo" width="220" height="440" src="${resumeThemeItem.previewImagePath}"/>
                    </g:link>
                    <g:if test="${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.resumeThemes?.last()?.id == resumeThemeItem?.id}">
                        <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">face</i></a>
                    </g:if>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <g:link controller="renderTheme" action="renderAppUserResume" id="${coolengineer.me.User.findByUsername('demo')?.appUser?.id}"
                            params="[themeId: resumeThemeItem.id]">
                        <asset:image class="hide-on-med-and-down" data-caption="'${resumeThemeItem.name}' Demo" width="200" height="300" src="${resumeThemeItem.previewImagePath}"/>
                        <asset:image class="hide-on-small-and-down hide-on-large-only" data-caption="'${resumeThemeItem.name}' Demo" width="300" height="330"
                                     src="${resumeThemeItem.previewImagePath}"/>
                        <asset:image class="hide-on-med-and-up" data-caption="'${resumeThemeItem.name}' Demo" width="220" height="440" src="${resumeThemeItem.previewImagePath}"/>
                    </g:link>
                </sec:ifNotLoggedIn>
                %{-- <a href="#">
                     <asset:image class="hide-on-small-and-down hide-on-large-only" data-caption="'${resumeThemeItem.name}' Demo" width="300" height="330" src="${resumeThemeItem.previewImagePath}"/>
                 </a>
                 <a href="#">
                     <asset:image class="hide-on-med-and-up" data-caption="'${resumeThemeItem.name}' Demo" width="220" height="440" src="${resumeThemeItem.previewImagePath}"/>
                 </a>--}%
            </div>

            %{--<div class="card-content">
                <span class="card-title grey-text text-darken-4">${resumeThemeItem?.name}</span>
            </div>--}%

            %{--<div class="card-action">
                <div class="row-fluid">
                    <sec:ifLoggedIn>
                        <g:link class="blue-grey-text text-lighten-1" controller="renderTheme" action="renderAppUserResume"
                                params="[themeId: resumeThemeItem.id]"><i class="left material-icons">edit</i>Use it</g:link>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn><a class="modal-trigger blue-grey-text text-lighten-1" href="#login"><i class="left material-icons">edit</i>Use it
                    </a></sec:ifNotLoggedIn>
                </div>
            </div>--}%
        </div>
    </div>
</g:each>