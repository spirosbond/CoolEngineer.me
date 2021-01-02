<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>

<g:render template="/layouts/navbar-dropdown" model="[activeId: 'nav-home']"/>

<div class="section white container">
    <div class="row">
        <div class="col s12">
            <h2 class="header">Create your Personal Online Resume</h2>

            <h6>Fill your profile. Choose your theme. Get your personal online resume under <sec:ifLoggedIn><a
                    href="http://${sec?.username()}.${grailsApplication?.config?.myserver?.url}"
                    target="_blank">${sec?.username()}.islinked.me</a></sec:ifLoggedIn><sec:ifNotLoggedIn><a
                    href="#">${'<your-username>'}.islinked.me</a></sec:ifNotLoggedIn>!</h6>
        </div>

        <div class="row">
            <div class="col s12">
                <sec:ifLoggedIn>
                    <g:link controller="appUser" action="showProfile" fragment="tab3" class="waves-effect waves-light btn"><i
                            class="material-icons right">edit</i>Set Up your profile</g:link>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <a class="modal-trigger waves-effect waves-light btn" href="#login"><i
                            class="material-icons right">edit</i>Get Started</a>
                %{--<g:link controller="appUser" action="showRegister" class="waves-effect waves-light btn"><i
                        class="material-icons right">edit</i>Step1: Get Started by signing up</g:link>--}%
                </sec:ifNotLoggedIn>
            </div>
        </div>
    </div>
</div>

<div id="parallax-container-1" class="parallax-container">

    <div class="section no-pad-bot">
        <div class="container">
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>

            <div class="row center">
                <h1 class="ml9 header center light col s12">
                    <span class="text-wrapper">
                        <span class="letters-1">Stand out from the crowd</span>
                    </span>
                </h1>
            </div>
        </div>
    </div>

    <div class="parallax"><asset:image src="home-parallax-image-top.jpg"/></div>
</div>

<div class="container section">

    <!--   Icon Section   -->
    <div class="row">
        <div class="col s12 m4">
            <div class="icon-block">
                <h2 class="center blue-grey-text"><i class="material-icons">flash_on</i></h2>
                <h5 class="center">Super Fast - Super flexible</h5>

                <p class="light">Create your profile and withing minutes have your online Resume ready! Choose from pre-optimized available themes and stand out with your personal IsLinked.me link.</p>
            </div>
        </div>

        <div class="col s12 m4">
            <div class="icon-block">
                <h2 class="center blue-grey-text"><i class="material-icons">group</i></h2>
                <h5 class="center">Be part of our Network</h5>

                <p class="light">Join the IsLinked network and unleash your full potential. Completely free & without tricks. Use our forum for connecting with other Engineers for any topic or question.</p>
            </div>
        </div>

        <div class="col s12 m4">
            <div class="icon-block">
                <h2 class="center blue-grey-text"><i class="material-icons">settings</i></h2>
                <h5 class="center">We are in stage ALPHA</h5>

                <p class="light">IsLinked.me has reached stage: Open Alpha! This means there will be bugs. There will be crashes. There will be problems. But hopefully this is still going to be a fun experience. Thank you for testing and reporting back your feebdack. Positive or Negative - all are welcome.</p>
            </div>
        </div>
    </div>

</div>

<div id="parallax-container-2" class="parallax-container">
    <div class="section no-pad-bot">
        <div class="container">
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>

            <div class="row center">
                <h1 class="ml9 header center light col s12">
                    <span class="text-wrapper">
                        <span class="letters-2">Create your stunning online CV</span>
                    </span>
                </h1>
            </div>
        </div>
    </div>

    <div class="parallax"><asset:image src="home-parallax-image-bottom.jpg"/></div>
</div>

<div class="section white container">
    <div class="row">
        <h2 class="header">Latest Themes</h2>

        <g:include controller="resumeTheme" action="getResumeThemeList" params="[active: true, max: 7, sort: 'dateCreated', order: 'desc']"/>

    </div>
</div>
<div class="divider"></div>
<div class="section white container">
    <div class="row">
        <h6 class="header center-align">Do you want a Theme based on YOUR resume?</h6>
        <p class="center-align">Send it to us @<a class="" href="mailto:contact@islinked.me">contact@islinked.me</a></p>
    </div>
</div>

<content tag="foot-scripts">
    <g:javascript>
        /*new Waypoint({
            element: document.getElementById('parallax-container-1'),
            handler: function (direction) {
                // Wrap every letter in a span
                var textWrapper = document.querySelector('.ml9 .letters-1');
                textWrapper.innerHTML = textWrapper.textContent.replace(/[^\s]+/g, "<span class='letter'>$&</span>");

                anime.timeline({loop: false}).add({
                    targets: '.ml9 .letter',
                    scale: [0, 1],
                    duration: 1500,
                    elasticity: 600,
                    delay: (el, i) => 45 * (i + 1)
                });
                this.destroy();
            },
            offset: '75%'
        });

        new Waypoint({
            element: document.getElementById('parallax-container-2'),
            handler: function () {
                // Wrap every letter in a span
                var textWrapper = document.querySelector('.ml9 .letters-2');
                textWrapper.innerHTML = textWrapper.textContent.replace(/[^\s]+/g, "<span class='letter'>$&</span>");

                anime.timeline({
                    loop: false
                }).add({
                    targets: '.ml9 .letter',
                    scale: [0, 1],
                    duration: 1500,
                    elasticity: 600,
                    delay: (el, i) => 45 * (i + 1)
                });
                this.destroy();
            },
            offset: '75%'
        });

*/
    </g:javascript>
</content>

</body>
</html>
