<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="CoolEngineer.me"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="fonts.css"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application_head.js"/>

    <g:render template="/layouts/ganalytics"/>

    <g:layoutHead/>
</head>

<body>

<g:ifPageProperty name="page.nav-dropdown-content">
    <g:pageProperty name="page.nav-dropdown-content"/>
</g:ifPageProperty>

<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper container">
            <a href="/" class="brand-logo right hide-on-small-and-down"><asset:image src="app-logo.png"/></a>
            <a href="/" class="brand-logo center hide-on-med-and-up"><asset:image src="app-logo-small.png"/></a>
            <a href="#" data-target="sidenav" class="sidenav-trigger hide-on-med-and-up no-margin"><i class="material-icons">menu</i></a>
            <ul id="nav-mobile" class="left hide-on-small-and-down">
                <g:ifPageProperty name="page.nav-content">
                    <g:pageProperty name="page.nav-content"/>
                </g:ifPageProperty>
            </ul>
        </div>
    </nav>
</div>
<ul class="sidenav" id="sidenav">
    <g:ifPageProperty name="page.sidenav-content">
        <g:pageProperty name="page.sidenav-content"/>
    </g:ifPageProperty>
</ul>

<g:layoutBody/>

<footer class="page-footer">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Support Us</h5>

                <p class="grey-text text-lighten-4">If you would like to support us you can post about us in the social media.</p>

                <p>We love hearing from you. What are we doing great? What could we improve? Drop us an email anytime!</p>

                <!-- Begin Mailchimp Signup Form -->

                <h5 class="white-text">Subscribe to hear from us</h5>

                <form action="https://coolengineer.us17.list-manage.com/subscribe/post" method="post" target="_blank">
                    <input type="hidden" name="u" value="0278add11b9162859397902e4">
                    <input type="hidden" name="id" value="1c37ac1d48">

                    <div class="input-field inline">
                        <label for="subscribe-email">Email Address</label>
                        <input id="subscribe-email" required name="MERGE0" type="email" value="${coolengineer.me.User.findByUsername(sec?.username())?.appUser?.email}" class="white-text validate" pattern="[0-9a-zA-Z_\-]*@[0-9a-zA-Z_\-]*\.[0-9a-zA-Z_\-]*">
                    </div>
                    <button type="submit" class="waves-effect waves-green btn-small">
                        Subscribe
                    </button>

                </form>

            </div>

            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Links</h5>
                <ul>
                    %{--                    icons from: https://www.iconfinder.com/iconsets/social-round-corner--}%
                    <li class="valign-wrapper"><i class="material-icons prefix">email</i><a class="grey-text text-lighten-3"
                                                                                            href="mailto:contact@coolengineer.me">&emsp;contact@coolengineer.me</a></li>
                    <li class="valign-wrapper my-icon"><asset:image data-caption="LinkedIn" src="icon-lin.png"/><a class="grey-text text-lighten-3" target="_blank"
                                                                                                                   href="http://linkedin.com">&emsp;LinkedIn</a></li>
                    <li class="valign-wrapper my-icon"><asset:image data-caption="Facebook" src="icon-fbook.png"/><a class="grey-text text-lighten-3" target="_blank"
                                                                                                                     href="http://facebook.com">&emsp;Facebook</a></li>
                    <li class="valign-wrapper my-icon"><asset:image data-caption="Twitter" src="icon-bird.png"/><a class="grey-text text-lighten-3" target="_blank"
                                                                                                                   href="http://twitter.com">&emsp;Twitter</a></li>
                    <li class="valign-wrapper"><i class="material-icons prefix">import_contacts</i><a class="grey-text text-lighten-3"
                                                                                                      href="/privacypolicy">&emsp;Privacy Policy</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="footer-copyright">
        <div class="container">
            © ${Calendar.getInstance().get(Calendar.YEAR)} CoolEngineer.me v<g:meta name="info.app.version"/> - Created by Engineers for Engineers &#10084;
        </div>
    </div>
</footer>


<sec:ifNotLoggedIn>
    <g:render template="/layouts/login_modal"/>
</sec:ifNotLoggedIn>

<asset:javascript src="application.js"/>

<sec:ifNotLoggedIn>
    <g:render template="/layouts/consent_pushpin"/>
</sec:ifNotLoggedIn>

%{--TODO: Make Spinner work
<div id="spinner" class="ld ld-ring ld-cycle spinner materialize-red-text">
--}%%{--    <g:message code="spinner.alt" default="Loading&hellip;"/>--}%%{--
</div>--}%

<g:javascript>
        var toastFlashMsg = '${flash.message}';
        if (toastFlashMsg) M.toast({html: toastFlashMsg, classes: 'rounded'});
        var toastFlashError = '${flash.error}';
        if (toastFlashError) M.toast({html: toastFlashError, classes: 'rounded'});
</g:javascript>

<!-- Custom placeholder for page scripts -->
<g:ifPageProperty name="page.foot-scripts">
    <g:pageProperty name="page.foot-scripts"/>
</g:ifPageProperty>

</body>
</html>
