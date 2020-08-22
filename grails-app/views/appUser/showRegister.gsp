<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 16/03/20
  Time: 19:56
--%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Cool Engineer</title>
</head>

<body>

<g:render template="/layouts/navbar-dropdown"/>

<div class="section white">
    <div class="row container">
        <h2 class="header">Sign Up</h2>

        <div class="card">
            <div class="card-content">
                <span class="card-title"></span>
            </div>

            <div class="card-tabs">
                <ul id="tabs" class="tabs tabs-fixed-width">
                    <li class="tab"><a class="active" href="#tab1">Profile</a></li>
                    <li class="tab"><a href="#tab2">Personal</a></li>
                </ul>
            </div>

            <g:form name="registration-form" controller="appUser" action="register" method="POST">
                <div class="card-content grey lighten-4">
                    <div id="tab1">
                        <div class="row">

                            <g:include controller="appUser" action="getAccountInputFields" params="[appUser: appUser]"/>
                            <g:include controller="appUser" action="getProfileInputFields" params="[appUser: appUser]"/>

                            <a id="btn-next" class="btn-small waves-effect waves-light right">Next<i class="material-icons right">navigate_next</i></a>
                        </div>
                    </div>

                    <div id="tab2">
                        <div class="row">

                            <g:include controller="appUser" action="getPersonalInputFields" params="[appUser: appUser]"/>


                            <a id="btn-prev" class="btn-small waves-effect waves-light left"><i class="material-icons left">navigate_before</i>Previous</a>

                            <button class="btn-small waves-effect waves-light right ld-over-inverse" onclick="submitElementClicked = this" type="submit">
                                Sign Up
                                <i class="material-icons right">send</i>
                                <div class="ld ld-ring ld-spin"></div>
                            </button>

                        </div>
                    </div>
                </div>
            </g:form>

        </div>
    </div>
</div>

<div class="parallax-container">
    <div class="parallax"><asset:image src="appUser-showRegister-parallax-image-bottom.jpg"/></div>
</div>

<content tag="foot-scripts">
    <g:javascript>
        $(document).ready(function () {
            $("#btn-next").click(function () {
                var username = $("#username-new");
                if (username.val().length == 0) username.addClass('invalid');
                var password = $("#password-new");
                if (password.val().length == 0) password.addClass('invalid');
                var password_repeat = $("#password-repeat-new");
                if (password_repeat.val() != password.val()) password_repeat.addClass('invalid');
                var name = $("#name");
                if (name.val().length == 0) name.addClass('invalid');
                var surname = $("#surname");
                if (surname.val().length == 0) surname.addClass('invalid');
                var email = $("#email");
                if (email.val().length == 0) email.addClass('invalid');

                if (document.getElementsByClassName("invalid").length == 0) {
                    var el = document.getElementById("tabs");
                    var instance = M.Tabs.getInstance(el);
                    instance.select('tab2');
                }
            });

            $("#btn-prev").click(function () {
                var el = document.getElementById("tabs");
                var instance = M.Tabs.getInstance(el);
                instance.select('tab1');
            });

        });
    </g:javascript>
</content>

</body>
</html>