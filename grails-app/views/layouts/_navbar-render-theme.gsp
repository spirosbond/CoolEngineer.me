%{--Requires themeId param--}%
<content tag="nav-render-theme">
    <ul id="nav-mobile" class="nav-bar blue-grey darken-3">
        <li class="nav-bar-item-left"><a href="javascript:history.back()"><< Go Back</a></li>
        <sec:ifLoggedIn>
            <li class="nav-bar-item-left"><g:link controller="appUser" action="showProfile">My Profile</g:link></li>
        %{--        <li class="nav-bar-item-left"><g:link controller="renderTheme" action="renderThemes">Themes</g:link></li>--}%
            <li class="nav-bar-item-right blue-grey lighten-1">
                <a href="http://${sec?.username()}.${grailsApplication?.config?.myserver?.url}" target="_blank">${sec?.username()}.islinked.me</a>
            </li>
            <li class="nav-bar-item-right materialize-red">
                %{--<g:link controller="appUser" action="saveTheme"
                        params="[id: coolengineer.me.User?.findByUsername(sec?.username())?.appUser.id, themeId: params.themeId]">Save</g:link>--}%
                <span class="ld-over-inverse" onclick="meerkatRemoteFunction(
                    this,
                    '${createLink(controller: 'appUser', action: 'saveThemeAjax')}',
                    'POST',
                    {
                        id: ${coolengineer.me.User?.findByUsername(sec?.username())?.appUser.id},
                        themeId: ${params.themeId}
                    },
                    function (resp) {
                        console.log(resp)
                    },
                    function (resp) {
                        console.log(resp)
                    })">
                    Save
                    <div class="ld ld-ring ld-spin"></div>

                </span>
            </li>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
            <li class="nav-bar-item-right"><g:link controller="appUser" action="showProfile">Login</g:link></li>
        </sec:ifNotLoggedIn>
        <li class="nav-bar-item-right">
            <a>
                <div class="switch">
                    <label>Demo Mode</label>
                    <label>
                        <sec:ifLoggedIn>
                            <input type="checkbox" id="demo-switch">
                        </sec:ifLoggedIn>
                        <sec:ifNotLoggedIn>
                            <input disabled type="checkbox" id="demo-switch">
                        </sec:ifNotLoggedIn>
                        <div class="lever"></div>
                    </label>
                </div>

            </a>
        </li>
    </ul>

</content>

<content tag="foot-scripts">
    <g:javascript>

        var demoSwitch = document.getElementById("demo-switch");
        var username = '${appUser.user.username}';

        if(username === '' || username === 'demo'){
            demoSwitch.checked = 1;
        }

        demoSwitch.addEventListener('change', (event) => {
            if (event.target.checked) {
                window.location.replace("<g:createLink controller='renderTheme' action='renderAppUserResume' id='${coolengineer.me.User.findByUsername("demo")?.appUser?.id}'
                                                       params='[themeId: params.themeId]'/>");
            } else {
                window.location.replace("<g:createLink controller='renderTheme' action='renderAppUserResume'
                                                       id='${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.id}' params='[themeId: params.themeId]'/>");
            }
        })
        if (typeof jQuery !== 'undefined') {
    (function ($) {
        $('#spinner').ajaxStart(function () {
            $(this).fadeIn();
        }).ajaxStop(function () {
            $(this).fadeOut();
        });
    })(jQuery);

}

    </g:javascript>

</content>
