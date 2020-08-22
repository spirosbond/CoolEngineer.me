<!-- Dropdown Structure -->
<content tag="nav-dropdown-content">
    <ul id="dropdown-profile" class="dropdown-content">
        <li class="nav-my-resume"><a href="http://${sec?.username()}.${grailsApplication?.config?.myserver?.url}" target="_blank">My Resume</a></li>
        <li class="nav-my-profile"><g:link controller="appUser" action="showProfile">My Profile</g:link></li>
        <li class="nav-logout"><a href="/logout">Logout</a></li>
    </ul>
</content>

<content tag="nav-content">
    <li class="nav-home"><a href="/">Home</a></li>
    <li class="nav-renderThemes"><g:link controller="renderTheme" action="renderThemes">Themes</g:link></li>
    <sec:ifLoggedIn>
        <li><a class="dropdown-trigger" href="#!" data-target="dropdown-profile"><i class="material-icons left">dvr</i>${sec?.username()}.coolengineer.me<i
                class="material-icons right">arrow_drop_down</i></a></li>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn><li class="nav-login"><a class="modal-trigger" href="#login">Login</a></li></sec:ifNotLoggedIn>
</content>

<content tag="sidenav-content">
    <sec:ifLoggedIn>
        <li>
            <div class="user-view">
                <div class="background">
                    <asset:image src="sidenav-background-1.jpg"/>
                </div>
                <g:link controller="appUser" action="showProfile">
                    <img class="circle"
                         src="<g:createLink controller="appUser" action="featuredImage" id="${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.id}"/>"
                         alt="${sec?.username()}"/>
                </g:link>
                <g:link controller="appUser" action="showProfile">
                    <span class="white-text name">${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.name} ${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.surname}</span>
                </g:link>
                <a href="http://${sec?.username()}.${grailsApplication?.config?.myserver?.url}" target="_blank">
                    <span class="white-text email">${sec?.username()}.coolengineer.me</span></a>
            </div>
        </li>
    </sec:ifLoggedIn>
    <li class="nav-home"><a href="/">Home</a></li>
    <li class="nav-renderThemes"><g:link controller="renderTheme" action="renderThemes">Themes</g:link></li>
    <li><div class="divider"></div></li>
    <sec:ifLoggedIn>
        <li class="nav-my-profile"><g:link controller="appUser" action="showProfile">My Profile</g:link></li>
        <li class="nav-logout"><a href="/logout">Logout</a></li>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <li class="nav-login"><a class="modal-trigger" href="#login">Login</a></li>
    </sec:ifNotLoggedIn>
    <li><div class="divider"></div></li>
    <li><a class="subheader">CoolEngineer.me</a></li>
</content>

<g:javascript>
    var activeId = '${this.activeId}';
    Array.prototype.slice.call(document.getElementsByClassName(activeId)).forEach(item => {
        item.classList.add('active');
    });
</g:javascript>