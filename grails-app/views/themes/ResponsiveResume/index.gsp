<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>${this.appUser?.name} ${this.appUser?.surname}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!--Custom fonts. To improve load times, remove this and update the h1 styling in style.css-->
    %{--    <link href='http://fonts.googleapis.com/css?family=Lato:300,700' rel='stylesheet' type='text/css'>--}%
    <asset:stylesheet src="ResponsiveResume/fonts.css"/>
    <!-- stylesheets -->
    %{--	<link rel="stylesheet" href="style.css" type="text/css" />--}%
    <asset:stylesheet src="ResponsiveResume/style.css"/>
    <!-- favicon -->
    <asset:link rel="shortcut icon" href="favicon.ico"/>

</head>

<body>

<!-- Header-->
<header>
    <h1>${this.appUser?.name} ${this.appUser?.surname}</h1>

    <p>${this.appUser?.headline}</p>
</header>

<div class="container">

    <!-- Introduction-->
    <section class="center">
        <h1>Welcome!</h1>

        <p>
            ${this.appUser?.aboutMe}
        </p>
    </section>

    <hr>

    %{--<!-- Gallery Block-->
    <section class="gallery">
        <h1 class="center">Gallery</h1>
        <div class="row">
            <a href="#"><asset:image src="ResponsiveResume/re.png" class="grid-2"/></a>
            <a href="#"><asset:image src="ResponsiveResume/re.png" class="grid-2"/></a>
            <a href="#"><asset:image src="ResponsiveResume/re.png" class="grid-2"/></a>
            <a href="#"><asset:image src="ResponsiveResume/re.png" class="grid-2"/></a>
            <a href="#"><asset:image src="ResponsiveResume/re.png" class="grid-2"/></a>
            <a href="#"><asset:image src="ResponsiveResume/re.png" class="grid-2"/></a>
        </div>
    </section>

    <hr>

    <!-- Testimonials-->
    <section class="testimonial">
        <div class="row">
            <div class="grid-2">
                <img src="img/re.png">
                <h2>Their Name</h2>
                <p>You can use this as a place to put recommendations, accolades and testimonials</p>
            </div>

            <div class="grid-2">
                <img src="img/re.png">
                <h2>Their Name</h2>
                <p>You can use this as a place to put recommendations, accolades and testimonials</p>
            </div>

            <div class="grid-2">
                <img src="img/re.png">
                <h2>Their Name</h2>
                <p>You can use this as a place to put recommendations, accolades and testimonials</p>
            </div>
        </div>
    </section>
</div> <!-- End container-->

<!-- Spotlight -->
<section class="spotlight">
    <div class="container">
        <div class="row">
            <div class="grid-3">
                <img src="img/spotlight.jpg">
            </div>
            <div class="grid-3">
                <h1>Project Spotlight</h1>
                <p>Give a brief description of what this project is and what role you played. It can also be helpful to include a link</p>
                <a href="#">View Project</a>
            </div>
        </div>
    </div>
</section>--}%


    <!-- New container-->
    <div class="container">
        <g:each in="${this.appUser?.educationList}">

            <section class="education">
                <h2>${it?.name} - ${it?.sector}</h2>
            </section>
        </g:each>

        <hr>

        <!--Experience Tables-->
        <section class="experience">
            <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

                <div class="row">
                    <div class="grid-2">
                        <h2>${workExpItem?.employerName}</h2>

                        <p><g:formatDate format="yyy-MM-dd" date="${workExpItem?.startDate}"/> to <g:if
                                test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate
                                format="yyy-MM-dd" date="${workExpItem?.endDate}"/></g:else></p>
                    </div>

                    <div class="grid-4">
                        <h3>${workExpItem?.title}</h3>
                        <ul>
                            <li>${workExpItem?.description}</li>

                        </ul>
                    </div>
                </div>
            </g:each>

        </section>

        <hr>

        <section>
            <!--List of skills-->
            <div class="row">
                <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">

                    <div class="grid-2">
                        <h1>${skillCategory?.skillCategoryName}</h1>
                        <ul>
                            <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">

                                <li>${skillItem?.skillName}</li>
                            </g:each>
                        </ul>
                    </div>
                </g:each>
            %{--<div class="grid-4">
                <h1>In Conclusion</h1>

                <p>
                    This is a good spot to highlight experiance and skills. Make sure to include a call to action like a link to your website, or your email address.
                    If you find bugs, want features, or have questions, feel free to submit an <a
                        href="https://github.com/philipcdavis/responsive-resume/issues">issue</a>. You are free to use without attribution.
                If you're ok sharing, I would love seeing what you make! Shoot me an
                    <a href="mailto:Phillysoul11@gmail.com?Subject=Responsive%20Resume" target="_top">email</a> or
                    <a href="http://www.twitter.com/philipcdavis">tweet</a> at me.
                </p>
            </div>--}%
            </div>
        </section>



        <!--Footer-->
        <footer class="center">
            <hr>
            <span>© 2020 Cool Engineer</span>
        </footer>

    </div><!-- End Container -->

</body>
</html>
