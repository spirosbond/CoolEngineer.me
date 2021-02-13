<!DOCTYPE html>
<html>
<head>
    <title>${this.appUser?.name} ${this.appUser?.surname} - Curriculum Vitae</title>

    <meta name="viewport" content="width=device-width"/>
    <meta name="description" content="The Curriculum Vitae of Joe Bloggs."/>
    <meta charset="UTF-8">

    <asset:stylesheet src="ResponsiveCV/style.css"/>

    %{--    <link href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>--}%
    <asset:stylesheet src="ResponsiveCV/fonts.css"/>

</head>

<body id="top">
<div id="cv" class="instaFade">
    <div class="mainDetails">
        <div id="headshot" class="quickFade">
            %{--            <asset:image src="ResponsiveCV/headshot.jpg" alt="${this.appUser?.surname}"/>--}%
            <img style="object-fit: cover"
                 src="<g:createLink controller="appUser" action="featuredImage" id="${this.appUser?.id}"/>"
                 alt="${this.appUser?.name} ${this.appUser?.surname}"/>
        </div>

        <div id="name">
            <h1 class="quickFade delayTwo">${this.appUser?.name} ${this.appUser?.surname}</h1>

            <h2 class="quickFade delayThree">${this.appUser?.headline}</h2>
        </div>

        <div id="contactDetails" class="quickFade delayFour">
            <ul>
                <li>e: <a href="mailto:${this.appUser?.email}" target="_blank">${this.appUser?.email}</a></li>
                <li>w: <a href="http://${this.appUser?.url}" target="_blank">${this.appUser?.url}</a></li>
                <li>m: ${this.appUser?.phoneNumber}</li>
            </ul>
        </div>

        <div class="clear"></div>
    </div>

    <div id="mainArea" class="quickFade delayFive">
        <section>
            <article>
                <div class="sectionTitle">
                    <h1>Personal Profile</h1>
                </div>

                <div class="sectionContent">
                    <p>${this.appUser?.aboutMe}</p>
                </div>
            </article>

            <div class="clear"></div>
        </section>


        <section>
            <div class="sectionTitle">
                <h1>Work Experience</h1>
            </div>

            <div class="sectionContent">
                <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

                    <article>
                        <h2>${workExpItem?.title}</h2>

                        <p class="subDetails"><g:formatDate format="yyy-MM-dd"
                                                            date="${workExpItem?.startDate}"/> to <g:if
                                test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd"
                                                                                                   date="${workExpItem?.endDate}"/></g:else></p>

                        <p>${workExpItem?.description}</p>
                    </article>
                </g:each>

            </div>

            <div class="clear"></div>
        </section>


        <section>
            <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">

                <div class="sectionTitle">
                    <h1>${skillCategory?.skillCategoryName}</h1>
                </div>

                <div class="sectionContent">
                    <ul class="keySkills">
                        <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">

                            <li>${skillItem?.skillName}</li>
                        </g:each>
                    </ul>
                </div>

                <div class="clear"></div>
            </g:each>

            <div class="clear"></div>
        </section>


        <section>
            <div class="sectionTitle">
                <h1>Education</h1>
            </div>

            <div class="sectionContent">
                <g:each in="${this.appUser?.educationList}">

                    <article>
                        <h2>${it?.name}</h2>

                        <p class="subDetails"><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if
                                test="${it?.current}">Current</g:if><g:else><g:formatDate
                                format="yyy-MM-dd" date="${it?.endDate}"/></g:else></p>

                        <p>${it?.sector}</p>
                    </article>
                </g:each>

            </div>

            <div class="clear"></div>
        </section>

    </div>
</div>

</body>
</html>
