%{--source: http://julienben.dev/--}%
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=900, initial-scale=1">
    <title>Julien Benchetrit's CV</title>
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
    %{--<script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-90381068-1', 'auto');
        ga('send', 'pageview');
    </script>--}%
</head>

<body>
<div class="cv">
    <div class="name">Julien Benchetrit</div>

    <div class="description">Full Stack Web Developer, UX Aficionado</div>

    <div class="contact">
        <div>
            <div class="icon">
                <i class="fa fa-envelope-o"></i>
            </div>

            <div class="text">
                <a href="mailto:julienbenchetrit@gmail.com">julienbenchetrit@gmail.com</a>
            </div>
        </div>

        <div>
            <div class="icon">
                <i class="fa fa-location-arrow"></i>
            </div>

            <div class="text">Tel Aviv, Israel</div>
        </div>

        <div>
            <div class="icon">
                <i class="fa fa-linkedin-square"></i>
            </div>

            <div class="text">
                <a href="https://www.linkedin.com/in/julienben" target="_blank">linkedin.com/in/julienben</a>
            </div>
        </div>
    </div>

    <div class="contact">
        <div>
            <div class="icon">
                <i class="fa fa-phone"></i>
            </div>

            <div class="text">+972 58-544-8866</div>
        </div>

        <div>
            <div class="icon" style="font-size: 24px;">
                <i class="fa fa-birthday-cake"></i>
            </div>

            <div class="text">Dec 14th, 1989</div>
        </div>

        <div>
            <div class="icon">
                <i class="fa fa-github"></i>
            </div>

            <div class="text">
                <a href="https://github.com/julienben" target="_blank">github.com/julienben</a>
            </div>
        </div>
    </div>

    <div class="quote">
        <div>
            <i class="fa fa-quote-left"></i>
        </div>

        <div>Hi, I'm Julien. I'm into building elegant and engaging web apps that help solve meaningful&nbsp;issues.</div>
    </div>

    <div class="main typography">

        <div class="education">

            <div class="title">Education</div>

            <div class="job">
                <div class="time">2007 - 2010</div>

                <div class="position">Biomedical Engineering (BEng)</div>

                <div class="company">Imperial College London</div>
            </div>

            <div class="title">Volunteering</div>

            <div class="job">
                <div class="time">Summer 2009</div>

                <div class="position">Biomedical Equipment Technician</div>

                <div class="company">Engineering World Health</div>
            </div>

            <div class="job">
                <div class="time">2008 - 2010</div>

                <div class="position">First Aid Responder</div>

                <div class="company">St John Ambulance</div>
            </div>

        </div>

        <div class="experience">

            <div class="title">Experience</div>

            <div class="job">
                <div class="time">2017 - Present</div>

                <div class="position">Lead Front-End Developer</div>

                <div class="company">Healthy.io</div>
            </div>

            <div class="job">
                <div class="time">2015 - 2017</div>

                <div class="position">Full Stack Developer</div>

                <div class="company">monday.com</div>
                <ul>
                    <li>Developed a few of monday.com's largest features, including its account admin, team management system,
                    and the Gantt-like Timeline.
                    </li>
                    <li>Helped oversee the dev team's transition to React.</li>
                    <li>Rebuilt from scratch monday.com's homepage using a static site generator and placing emphasis on
                    performance, responsiveness, modularity, and&nbsp;SEO.</li>
                    <li>Crafted with precision HTML emails that are read daily by tens of thousands of&nbsp;users.</li>
                </ul>
            </div>

            <div class="job">
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
            </div>

            <!--<div class="job">
          <div class="time">2010 - 2012</div>
          <div class="position">Student Programs Coordinator</div>
          <div class="company">Engineering World Health</div>
          <ul>
            <li>Managed a service-learning program for engineering students and served as on-the-ground&nbsp;coordinator.</li>
            <li>Managed a network of university-based chapters. Grew the program from 20 to over 40&nbsp;universities.</li>
            <li>Led the development of biomedical test devices sold as educational engineering&nbsp;kits.</li>
          </ul>
        </div>-->

        </div>

    </div>

    <div class="separator"></div>

    <div class="extra">

        <div class="tools">
            <div class="title">Skills</div>
            <ul>
                <li>
                    <div>React &amp; Redux</div>

                    <div>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                        <i class="fa fa-circle"></i>
                    </div>
                </li>
                <li>
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
                </li>
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

        <div class="languages">
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
        </div>

        <div class="hobbies">
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
        </div>

    </div>

</div>
</body>

</html>