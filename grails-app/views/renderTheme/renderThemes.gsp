<%@ page import="coolengineer.me.ResumeTheme" %>
<%--
  Created by IntelliJ IDEA.
  User: Spyridon
  Date: 19/03/20
  Time: 00:07
--%>

<g:applyLayout name="main">

    <content tag="title">Cool Engineer</content>

    <g:render template="/layouts/navbar-dropdown" model="[activeId: 'nav-renderThemes']"/>

    <div class="section white container">
        <div class="row">
            <h2 class="header">Choose your Theme</h2>

            <g:include controller="resumeTheme" action="getResumeThemeList" params="[active: true, max: 20, sort: 'dateCreated', order: 'desc']"/>

        </div>
    </div>
    <div class="divider"></div>
    <div class="section white container">
        <div class="row">
            <h6 class="header center-align">Do you want a Theme based on YOUR resume?</h6>
            <p class="center-align">Send it to us @<a class="" href="mailto:contact@islinked.me">contact@islinked.me</a></p>
        </div>
    </div>

    <div class="parallax-container">
        <div class="section no-pad-bot">
            <div class="container">
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>
                <br/>

                <div class="row center">
                    <h1 class="header center light col s12">Choose your style</h1>
                </div>
            </div>
        </div>

        <div class="parallax"><asset:image src="renderTheme-renderThemes-parallax-image-bottom-2.jpg"/></div>
    </div>

</g:applyLayout>
