<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${this.appUser?.name} ${this.appUser?.surname}</title>
    <meta name="author" content="IsLinked.me">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="HandheldFriendly" content="true">
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    %{--    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Simonetta:400,900|Balthazar">--}%
    <asset:stylesheet src="ResponsivePageResume/fonts.css"/>
    <asset:stylesheet src="ResponsivePageResume/styles.css"/>
    <asset:stylesheet src="ResponsivePageResume/responsive.css"/>
    <!-- favicon -->
    <asset:link rel="shortcut icon" href="favicon.ico"/>
    <!--[if lt IE 9]>
    %{--<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>-->
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>--}%
    <![endif]-->
</head>

<body>
<div id="w" itemscope itemtype="%{--http://schema.org/Person--}%">
    <header class="clearfix">
        <div id="info">
            <h1><span itemprop="name">${this.appUser?.name} ${this.appUser?.surname}</span></h1>

            <h3><span itemprop="jobTitle">${this.appUser?.headline}</span></h3>
            <small itemprop="address" itemscope itemtype="%{--http://schema.org/PostalAddress--}%">
                <span itemprop="addressLocality">${this.appUser?.address}</span>
                %{--,<span itemprop="addressRegion">Massachusetts</span>,
%{--				  <span itemprop="addressCountry">USA</span>--}%
            </small>
            <small><span itemprop="email">${this.appUser?.email}</span></small>
            <small><a href="http://${this.appUser?.url}" target="_blank"
                      itemprop="url">${this.appUser?.url}</a>%{-- &bull; <a href="http://twitter.com/jakerocheleau" itemprop="url">@jakerocheleau</a>--}%
            </small>
        </div>

        <div id="photo">
            %{--				<img src="images/jake-rocheleau-250.jpg" alt="Jake Rocheleau resume photo avatar" itemprop="image" />--}%
            <img itemprop="image" width="200px" style="object-fit: cover"
                 src="<g:createLink controller="appUser" action="featuredImage" id="${this.appUser?.id}"/>"
                 alt="${this.appUser?.name} ${this.appUser?.surname}"/>
        </div>
    </header>

    <section id="profile">
        <h2>My History &amp; Profile</h2>

        <p itemprop="description">${this.appUser?.aboutMe}</p>
    </section>

    <section id="skills" class="clearfix" itemscope itemtype="%{--http://schema.org/ItemList--}%">
        <h2 itemprop="name">Skillset</h2>
        <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">
            <section id="skills-left">
                <h4 itemprop="about">${skillCategory?.skillCategoryName}</h4>
                <ul class="responsivepageresume">
                    <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">
                        <li class="responsivepageresume" itemprop="itemListElement">${skillItem?.skillName}</li>
                    </g:each>
                </ul>
            </section>
        </g:each>
    </section>

    <section id="education">
        <h2>Past Education</h2>
        <g:each in="${this.appUser?.educationList}">

            <p><span itemprop="alumniOf">${it?.name}</span>, ${it?.sector} &bull; <g:formatDate format="yyy-MM-dd"
                                                                                                date="${it?.startDate}"/> to <g:if
                    test="${it?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd"
                                                                              date="${it?.endDate}"/></g:else>.</p>
        </g:each>
    </section>

    <section id="experience">
        <h2>Work Experience</h2>
        <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

            <ul class="responsivepageresume"><li class="responsivepageresume">${workExpItem?.title}, ${workExpItem?.employerName} &bull; <g:formatDate format="yyy-MM-dd"
                                                                                        date="${workExpItem?.startDate}"/> to <g:if
                    test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd"
                                                                                       date="${workExpItem?.endDate}"/></g:else>

            </li></ul>
            <p>${workExpItem?.description}</p>
        </g:each>

    </section>

</div>
</body>
</html>
