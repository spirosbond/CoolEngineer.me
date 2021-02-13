<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>${this.appUser?.name} ${this.appUser?.surname}</title>

    <style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    body {
        font: 16px Helvetica, Sans-Serif;
        line-height: 24px;
        background: url('/assets/OnePageResume/noise.jpg');
    }

    .clear {
        clear: both;
    }

    #page-wrap {
        width: 800px;
        margin: 40px auto 60px;
    }

    #pic {
        float: right;
        margin: -30px 0 0 0;
    }

    h1 {
        margin: 0 0 16px 0;
        padding: 0 0 16px 0;
        font-size: 42px;
        font-weight: bold;
        letter-spacing: -2px;
        border-bottom: 1px solid #999;
    }

    h2 {
        font-size: 20px;
        margin: 0 0 6px 0;
        position: relative;
    }

    h2 span {
        position: absolute;
        bottom: 0;
        right: 0;
        font-style: italic;
        font-family: Georgia, Serif;
        font-size: 16px;
        color: #999;
        font-weight: normal;
    }

    h1 span {
        /*position: absolute;*/
        bottom: 0;
        right: 0;
        font-style: italic;
        font-family: Georgia, Serif;
        font-size: 20px;
        color: #999;
        font-weight: normal;
    }

    p {
        margin: 0 0 16px 0;
    }

    a {
        color: #999;
        text-decoration: none;
        border-bottom: 1px dotted #999;
    }

    a:hover {
        border-bottom-style: solid;
        color: black;
    }

    ul {
        margin: 0 0 32px 17px;
    }

    #objective {
        width: 500px;
        float: left;
    }

    #objective p {
        font-family: Georgia, Serif;
        font-style: italic;
        color: #666;
    }

    dt {
        font-style: italic;
        font-weight: bold;
        font-size: 18px;
        text-align: right;
        padding: 0 26px 0 0;
        width: 150px;
        float: left;
        height: 100px;
        border-right: 1px solid #999;
    }

    dd {
        width: 600px;
        float: right;
    }

    dd.clear {
        float: none;
        margin: 0;
        height: 15px;
    }
    </style>
</head>

<body>

<div id="page-wrap">

    %{--    <g:img src="${createLink(controller: 'appUser', action: 'featuredImage', id: this.appUser?.id)}" alt="Photo of Cthulu" id="pic"/>--}%
    %{--    <asset:image src="OnePageResume/cthulu.png" alt="Photo of Cthulu" id="pic"/>--}%
    <img id="pic" width="250px" src="<g:createLink controller="appUser" action="featuredImage" id="${this.appUser?.id}"/>" alt="${this.appUser?.name} ${this.appUser?.surname}"/>

    <div id="contact-info" class="vcard">

        <!-- Microformats! -->

        <h1 class="fn">${this.appUser?.name} ${this.appUser?.surname} <span>${this.appUser?.headline}</span></h1>

        <p>
            Cell: <span class="tel">${this.appUser?.phoneNumber}</span><br/>
            Email: <a class="email" href="mailto:${this.appUser?.email}">${this.appUser?.email}</a><br/>
            Website: <a class="page-link" target="_blank" href="//${this.appUser?.url}">${this.appUser?.url}</a>
        </p>
    </div>

    <div id="objective">
        <p>
            ${this.appUser?.aboutMe}
        </p>
    </div>

    <div class="clear"></div>

    <dl>
        <dd class="clear"></dd>

        <dt>Education</dt>
        <dd>
            <g:each in="${this.appUser?.educationList}">
                <h2>${it?.name} <span><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if test="${it?.current}">Current</g:if><g:else><g:formatDate
                        format="yyy-MM-dd" date="${it?.endDate}"/></g:else></span></h2>

                <p><strong>Major:</strong> ${it?.sector}
                %{--<br/>
                <strong>Minor:</strong> Scale Tending--}%
                </p>
            </g:each>
        </dd>

        <dd class="clear"></dd>

        <dt>Skills</dt>
        <dd>
            <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">
                <g:each in="${skillCategory.skillList}">
                    <h2>${it?.skillName}</h2>

                    <p>${it?.level}/5
                    %{--<br/>
                    <strong>Minor:</strong> Scale Tending--}%
                    </p>
                </g:each>
            </g:each>

        </dd>

        <dd class="clear"></dd>

        <dt>Experience</dt>
        <dd>
            <g:each in="${this.appUser?.workExpList}">

                <h2>${it?.title} <span>${it?.employerName}, ${it?.location}, <g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if
                        test="${it?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd" date="${it?.endDate}"/></g:else></span>
                </h2>
                <ul>
                    <li>${it?.description}</li>
                    %{--<li>Helped coordinate managers to grow cult following</li>
                    <li>Provided untimely deaths to all who opposed</li>--}%
                </ul>
            </g:each>
        </dd>

        <dd class="clear"></dd>

        <dt>Hobbies</dt>
        <dd>World Domination, Deep Sea Diving, Murder Most Foul</dd>

        <dd class="clear"></dd>

        <dt>References</dt>
        <dd>Available on request</dd>

        <dd class="clear"></dd>
    </dl>

    <div class="clear"></div>

</div>

</body>

</html>
