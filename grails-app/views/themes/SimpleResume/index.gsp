<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${this.appUser?.name} ${this.appUser?.surname} - Resume</title>
    <asset:stylesheet src="SimpleResume/style.css"/>
%{--    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,400,700|Source+Sans+Pro:400,400i" rel="stylesheet">--}%
    <asset:stylesheet src="SimpleResume/fonts.css"/>

    <!-- favicon -->
    <asset:link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
<div class="page">
    <div class="section row">
        <h1 class="col"><span style="font-weight:700">${this.appUser?.name}</span> ${this.appUser?.surname}</h1>

        <div class="contact-info col-right">
            <div>${this.appUser?.phoneNumber}</div>

            <div><a href="mailto:${this.appUser?.email}" target="_blank">${this.appUser?.email}</a></div>

            <div><a href="http://${this.appUser?.url}" target="_blank">${this.appUser?.url}</a></div>
        </div>
    </div>

    <div class="section row">
        <h2 class="col">About Me</h2>

        <div class="section-text col-right"><span class="key">${this.appUser?.aboutMe}</div>
    </div>

    <div class="section row">
        <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">

            <h2 class="col">${skillCategory?.skillCategoryName}</h2>

            <div class="section-text col row">
            <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">
                <g:if test="${i % 3 == 0}">

                    <ul class="skills" style="width:25%">
                </g:if>
                <g:if test="${(i + 1) % 3 == 0}">

                    <li>${skillItem?.skillName}</li>

                    </ul>
                </g:if>
                <g:else>
                    <li>${skillItem?.skillName}</li>
                </g:else>
                <g:if test="${i == skillCategory?.skillList?.size() - 1}">
                    </ul>

                </g:if>
            </g:each>

            </div>

        </g:each>

    </div>

    <div class="section row">
        <h2 class="col">Education</h2>

        <g:each in="${this.appUser?.educationList}">

            <div class="section-text col-right">
                <h3><span class="emph">${it?.name}</span></h3>

                <div>${it?.sector}</div>

                <div class="row">
                    %{--                <div class="col light">New York, USA</div>--}%

                    <div class="col-right light"><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if test="${it?.current}">Current</g:if><g:else><g:formatDate
                            format="yyy-MM-dd" date="${it?.endDate}"/></g:else></div>
                </div>
            </div>
        </g:each>

    </div>

    <div class="section row">
        <h2 class="col">Experience</h2>
        <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

            <div class="section-text col-right">
                <div class="row">
                    <div class="col">
                        <h3>${workExpItem?.employerName}</h3>
                    </div>
                </div>

                <div class="row subsection">
                    <div class="emph col">${workExpItem?.title}</div>

                    <div class="col-right light"><g:formatDate format="yyy-MM-dd" date="${workExpItem?.startDate}"/> to <g:if
                            test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd" date="${workExpItem?.endDate}"/></g:else></div>
                </div>
                <ul class="desc">
                    <li>${workExpItem?.description}</li>
                </ul>
            </div>
        </g:each>

    </div>

    %{--<div class="section row">
        <h2 class="col">Projects</h2>

        <div class="section-text col-right">
            <h3><a href="https://github.com/nuterian">github.com/nuterian</a></h3>
        </div>
    </div>--}%

    %{--<div class="section row">
        <h2 class="col">Honors</h2>

        <div class="section-text col-right">
            <div class="row">
                <div class="col">
                    <h3>SEARCC International School's Software Competition</h3>
                </div>
            </div>

            <div class="row subsection">
                <div class="emph col">Algorithmic Programming Competition</div>

                <div class="col-right light">Fall 2007</div>
            </div>

            <div class="desc">Organized by the Computer Society of India, was part of a team of three to represent our region at
            the national level finals. Finished <span class="emph">second</span> by solving the maximum number of problems.
            </div>
        </div>
        
        <div class="section-text col-right">
            <div class="row">
                <div class="col">
                    <h3>Codechef Gamer's Challenge</h3>
                </div>
            </div>

            <div class="row subsection">
                <div class="emph col">Actionscript/HTML5 Game Development Competition</div>

                <div class="col-right light">Summer 2009</div>
            </div>

            <div class="desc">Developed a prototypical game using Actionscript on the Flash platform, in less than 48 hours. Received an honorable mention award for the <span
                    class="emph">Best Looking Game</span>.</div>
        </div>
    </div>--}%
</div>
</body>
</html>
