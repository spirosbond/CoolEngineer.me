<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
%{--    <meta name="viewport" content="width=900, initial-scale=1">--}%
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${this.appUser?.name} ${this.appUser?.surname} CV</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    %{--  <link href="index.css" rel="stylesheet">--}%
    <g:if test="${params.color == 'green'}">
        <asset:stylesheet src="DevPageResume/green/index.css" media="all"/>
    </g:if>
    <g:else>
        <asset:stylesheet src="DevPageResume/blue/index.css" media="all"/>
    </g:else>

</head>

<body>
<div class="cv">
    <div class="name">${this.appUser?.name} ${this.appUser?.surname}</div>

    <div class="description">${this.appUser?.headline}</div>

    <div class="contact">
        <div>
            <div class="icon">
                <i class="fa fa-envelope-o"></i>
            </div>

            <div class="text">
                <a href="mailto:${this.appUser?.email}">${this.appUser?.email}</a>
            </div>
        </div>

        <div>
            <div class="icon">
                <i class="fa fa-location-arrow"></i>
            </div>

            <div class="text">${this.appUser?.address}</div>
        </div>

        <div>
            <div class="icon">
                <i class="fa fa-link"></i>
            </div>

            <div class="text">
                <a href="http://${this.appUser?.url}" target="_blank">${this.appUser?.url}</a>
            </div>
        </div>
    </div>

    <div class="contact">
        <div>
            <div class="icon">
                <i class="fa fa-phone"></i>
            </div>

            <div class="text">${this.appUser?.phoneNumber}</div>
        </div>

        <div>
            <div class="icon" style="font-size: 24px;">
                <i class="fa fa-birthday-cake"></i>
            </div>

            <div class="text"><g:formatDate format="yyy-MM-dd" date="${this.appUser?.dateOfBirth}"/></div>
        </div>

        %{--<div>
            <div class="icon">
                <i class="fa fa-github"></i>
            </div>

            <div class="text">
                <a href="http://${this.appUser?.url}" target="_blank">${this.appUser?.url}</a>
            </div>
        </div>--}%
    </div>

    <div class="quote">
        <div>
            <i class="fa fa-quote-left"></i>
        </div>

        <div>${this.appUser?.aboutMe}</div>
    </div>

    <div class="main typography">

        <div class="education">

            <div class="title">Education</div>

            <g:each in="${this.appUser?.educationList}">

                <div class="job">
                    <div class="time"><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> - <g:if
                            test="${it?.current}">Current</g:if><g:else><g:formatDate
                            format="yyy-MM-dd" date="${it?.endDate}"/></g:else></div>

                    <div class="position">${it?.sector}</div>

                    <div class="company">${it?.name}</div>
                </div>
            </g:each>
        %{--<div class="title">Volunteering</div>

        <div class="job">
            <div class="time">Summer 2009</div>

            <div class="position">Biomedical Equipment Technician</div>

            <div class="company">Engineering World Health</div>
        </div>

        <div class="job">
            <div class="time">2008 - 2010</div>

            <div class="position">First Aid Responder</div>

            <div class="company">St John Ambulance</div>
        </div>--}%

        </div>

        <div class="experience">

            <div class="title">Experience</div>

        %{-- <div class="job">
             <div class="time">2017 - Present</div>

             <div class="position">Lead Front-End Developer</div>

             <div class="company">Healthy.io</div>
         </div>--}%
            <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

                <div class="job">
                    <div class="time"><g:formatDate format="yyy-MM-dd" date="${workExpItem?.startDate}"/> - <g:if
                            test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate
                            format="yyy-MM-dd" date="${workExpItem?.endDate}"/></g:else></div>

                    <div class="position">${workExpItem?.title}</div>

                    <div class="company">${workExpItem?.employerName}</div>
                    <ul>
                        <li>${workExpItem?.description}
                        </li>
                        %{--<li>Helped oversee the dev team's transition to React.</li>
                        <li>Rebuilt from scratch monday.com's homepage using a static site generator and placing emphasis on
                        performance, responsiveness, modularity, and&nbsp;SEO.</li>
                        <li>Crafted with precision HTML emails that are read daily by tens of thousands of&nbsp;users.</li>--}%
                    </ul>
                </div>
            </g:each>

        %{--<div class="job">
            <div class="time">2012 - 2015</div>

            <div class="position">Full Stack Developer</div>

            <div class="company">Signals Analytics</div>
            <ul>
                <li>Design and development of a BI-reporting tool and additional client-facing web apps (BE in PHP, FE
                using React or Angular).</li>
                <li>Development of interactive data visualizations for Fortune 500 clients.</li>
                <li>Technical adviser on new projects, defining methods for data collection, transformation,
                and&nbsp;analysis.</li>
            </ul>
        </div>

        <div class="job">
            <div class="time">2011 - 2012</div>

            <div class="position">Full Stack Developer</div>

            <div class="company">Waste To Watts</div>
            <ul>
                <li>Development of a platform to store and display data in real-time about the health of the power grid
                in&nbsp;India.</li>
            </ul>
        </div>--}%

        </div>

    </div>

    <div class="separator"></div>

    <div class="extra">

        <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">
            <div class="tools">

                <div class="title">${skillCategory?.skillCategoryName}</div>
                <ul>
                    <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">

                        <li>
                            <div>${skillItem?.skillName}</div>

                            <div>
                                <g:if test="${skillItem?.level != 0}">
                                    <g:each in="${(1..5)}" var="level">
                                        <g:if test="${skillItem?.level >= level}">
                                            <i class="fa fa-circle"></i>
                                        </g:if>
                                        <g:else>
                                            <i class="fa fa-circle-o"></i>

                                        </g:else>
                                    </g:each>
                                </g:if>
                            %{--       <i class="fa fa-circle"></i>
                           <i class="fa fa-circle"></i>
                           <i class="fa fa-circle"></i>
                           <i class="fa fa-circle"></i>
                           <i class="fa fa-circle"></i>--}%
                            </div>
                        </li>
                    </g:each>

                %{--<li>
                    <div>CSS &amp; Layouts</div>

                    <div>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                    </div>
                </li>
                <li>
                    <div>Node.js</div>

                    <div>
                        <i class="fa fa-circle-o"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                    </div>
                </li>
                <li>
                    <div>UX Design</div>

                    <div>
                        <i class="fa fa-circle-o"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                    </div>
                </li>--}%
                <!--<li>
            <div>Ruby on Rails</div>
            <div>
              <i class="fa fa-circle-o"></i>
              <i class="fa fa-circle-o"></i>
              <i class="fa fa-circle-o"></i>
              <i class="fa fa-circle"></i>
              <i class="fa fa-circle"></i>
            </div>
          </li>-->
                </ul>
            </div>
        </g:each>


    %{--<div class="languages">
        <div class="title">Languages</div>
        <ul>
            <li>
                <div>English</div>

                <div>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                </div>
            </li>
            <li>
                <div>French</div>

                <div>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                </div>
            </li>
            <li>
                <div>Spanish</div>

                <div>
                    <i class="fa fa-circle-o"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                </div>
            </li>
            <li>
                <div>Hebrew</div>

                <div>
                    <i class="fa fa-circle-o"></i>
                    <i class="fa fa-circle-o"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                    <i class="fa fa-circle"></i>
                </div>
            </li>
            <!--<li>
        <div>Italian</div>
        <div>
          <i class="fa fa-circle-o"></i>
          <i class="fa fa-circle-o"></i>
          <i class="fa fa-circle-o"></i>
          <i class="fa fa-circle-o"></i>
          <i class="fa fa-circle"></i>
        </div>-->
        </li>
        </ul>
    </div>--}%

    %{--<div class="hobbies">
        <div class="title">Hobbies</div>

        <div class="icons">
            <i class="fa fa-bicycle" title="Cycling"></i>
            <i class="fa fa-github" title="Open Source"></i>
            <i class="fa fa-paw" title="My dog"></i>
            <i class="fa fa-paint-brush" title="Painting"></i>
            <i class="fa fa-medium" title="https://medium.com/@jbenchetrit"></i>
            <i class="fa fa-lastfm-square" title="http://www.last.fm/user/BJH1412"></i>
            <!-- <i class="fa fa-meetup"></i> -->
            <!-- <i class="fa fa-wpexplorer"></i> -->
            <!--<i class="fa fa-beer" title="Beer"></i>-->
            <!-- <i class="fa fa-gamepad"></i> -->
            <!-- <i class="fa fa-steam"></i> -->
            <!--<i class="fa fa-futbol-o" title="Football"></i>-->
            <!--<i class="fa fa-imdb" title="Movies"></i>-->
            <!-- <i class="fa fa-reddit" title="Reddit"></i> -->
        </div>
    </div>--}%

    </div>

</div>
</body>

</html>