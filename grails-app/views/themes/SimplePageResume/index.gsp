<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${this.appUser?.name} ${this.appUser?.surname}</title>
    <g:if test="${params.color == 'blue'}">
        <asset:stylesheet src="SimplePageResume/blue/blue.css"/>
        <asset:stylesheet src="SimplePageResume/blue/print.css" media="print"/>
    </g:if>
    <g:elseif test="${params.color == 'brown'}">
        <asset:stylesheet src="SimplePageResume/brown/brown.css"/>
        <asset:stylesheet src="SimplePageResume/brown/print.css" media="print"/>
    </g:elseif>
    <g:elseif test="${params.color == 'green'}">
        <asset:stylesheet src="SimplePageResume/green/green.css"/>
        <asset:stylesheet src="SimplePageResume/green/print.css" media="print"/>
    </g:elseif>
    <g:elseif test="${params.color == 'purple'}">
        <asset:stylesheet src="SimplePageResume/purple/purple.css"/>
        <asset:stylesheet src="SimplePageResume/purple/print.css" media="print"/>
    </g:elseif>
    <g:else>
        <asset:stylesheet src="SimplePageResume/red/red.css"/>
        <asset:stylesheet src="SimplePageResume/red/red.css" media="print"/>
    </g:else>

    <!--[if IE 7]>
    <asset:stylesheet src="SimplePageResume/ie7.css"/>
    <![endif]-->
    <!--[if IE 6]>
    <asset:stylesheet src="SimplePageResume/ie6.css"/>
    <![endif]-->
    <asset:javascript src="SimplePageResume/jquery-1.4.2.min.js"/>
    <asset:javascript src="SimplePageResume/jquery.tipsy.js"/>
    <asset:javascript src="SimplePageResume/cufon.yui.js"/>
    <asset:javascript src="SimplePageResume/scrollTo.js"/>
    <asset:javascript src="SimplePageResume/myriad.js"/>
    <asset:javascript src="SimplePageResume/jquery.colorbox.js"/>
    <asset:javascript src="SimplePageResume/custom.js"/>

    <script type="text/javascript">
        Cufon.replace('h1,h2');
    </script>
</head>

<body>
<!-- Begin Wrapper -->
<div id="wrapper">
    <div class="wrapper-top"></div>

    <div class="wrapper-mid">
        <!-- Begin Paper -->
        <div id="paper">
            <div class="paper-top"></div>

            <div id="paper-mid">
                <div class="entry">
                    <!-- Begin Image -->
                    %{--                    <asset:image class="portrait" src="SimplePageResume/image.jpg" alt="${this.appUser?.name} ${this.appUser?.surname}"/>--}%
                    <img class="portrait" src="<g:createLink controller="appUser" action="featuredImage" id="${this.appUser?.id}"/>"
                         alt="${this.appUser?.name} ${this.appUser?.surname}"/>

                    <!-- End Image -->
                    <!-- Begin Personal Information -->
                    <div class="self">
                        <h1 class="name">${this.appUser?.name} ${this.appUser?.surname}<br/>
                            <span>${this.appUser?.headline}</span></h1>
                        <ul>
                            <li class="ad">${this.appUser?.address}</li>
                            <li class="mail">${this.appUser?.email}</li>
                            <li class="tel">${this.appUser?.phoneNumber}</li>
                            <li class="web">${this.appUser?.url}</li>
                        </ul>
                    </div>
                    <!-- End Personal Information -->
                    <!-- Begin Social -->
                    <div class="social">
                        <ul>
                            <li><a class='north' href="javascript:window.print()" title="Print"><asset:image src="SimplePageResume/icn-print.jpg" alt=""/></a></li>
                        </ul>
                    </div>
                    <!-- End Social -->
                </div>
                <!-- Begin 1st Row -->
                <div class="entry">
                    <h2>OBJECTIVE</h2>

                    <p>${this.appUser?.aboutMe}</p>
                </div>
                <!-- End 1st Row -->
                <!-- Begin 2nd Row -->
                <div class="entry">
                    <h2>EDUCATION</h2>

                    <g:each in="${this.appUser?.educationList}">
                        <div class="content">
                            <h3><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if test="${it?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd"
                                                                                                                                                              date="${it?.endDate}"/></g:else></h3>

                            <p>${it?.name}<br/>
                                <em>${it?.sector}</em></p>
                        </div>
                    </g:each>
                </div>
                <!-- End 2nd Row -->
                <!-- Begin 3rd Row -->
                <div class="entry">
                    <h2>EXPERIENCE</h2>
                    <g:each in="${this.appUser?.workExpList}">
                        <div class="content">
                            <h3><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if test="${it?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd"
                                                                                                                                                              date="${it?.endDate}"/></g:else></h3>

                            <p>${it?.employerName}, ${it?.location} <br/>
                                <em>${it?.title}</em></p>
                            <ul class="info">
                                <li>${it?.description}.</li>
                            </ul>
                        </div>
                    </g:each>
                </div>
                <!-- End 3rd Row -->
                <!-- Begin 4th Row -->
                <div class="entry">
                    <h2>SKILLS</h2>
                    <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">

                        <div class="content">
                            <h3>${skillCategory?.skillCategoryName}</h3>
                            <ul class="skills">

                                <g:each in="${skillCategory?.skillList}">
                                    <li>${it?.skillName}</li>
                                </g:each>
                            </ul>
                        </div>

                    </g:each>
                </div>
                <!-- End 4th Row -->
                <!-- Begin 5th Row -->
                <div class="entry">
                    <h2>WORKS</h2>
                    <ul class="works">
                        <li><a href="images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/2.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/3.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/2.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/3.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                        <li><a href="images/1.jpg" rel="gallery" title="Lorem ipsum dolor sit amet."><asset:image src="SimplePageResume/image.jpg" alt=""/></a></li>
                    </ul>
                </div>
                <!-- Begin 5th Row -->
            </div>

            <div class="clear"></div>

            <div class="paper-bottom"></div>
        </div>
        <!-- End Paper -->
    </div>

    <div class="wrapper-bottom"></div>
</div>

<div id="message"><a href="#top" id="top-link">Go to Top</a></div>
<!-- End Wrapper -->
</body>
</html>
