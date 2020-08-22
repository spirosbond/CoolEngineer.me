<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns:asset="http://www.w3.org/1999/html">
<head>

    <title>${this.appUser?.name} ${this.appUser?.surname} | ${this.appUser?.email}</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>

    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    %{--    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.7.0/build/reset-fonts-grids/reset-fonts-grids.css" media="all"/>--}%
    <asset:stylesheet src="DIYResume/reset-fonts-grids.css" media="all"/>
    %{--	<link rel="stylesheet" type="text/css" href="resume.css" media="all" />--}%
    <asset:stylesheet src="DIYResume/resume.css" media="all"/>
    <!-- favicon -->
    <asset:link rel="shortcut icon" href="favicon.ico"/>

</head>

<body>

<div id="doc2" class="yui-t7">
    <div id="inner">

        <div id="hd">
            <div class="yui-gc">
                <div class="yui-u first">
                    <h1>${this.appUser?.name} ${this.appUser?.surname}</h1>

                    <h2>${this.appUser?.headline}</h2>
                </div>

                <div class="yui-u">
                    <div class="contact-info">
                        <h3><a id="pdf" class="button_print" href="javascript:;">Download PDF</a></h3>

                        <h3><a href="mailto:${this.appUser?.email}">${this.appUser?.email}</a></h3>

                        <h3>${this.appUser?.phoneNumber}</h3>
                    </div><!--// .contact-info -->
                </div>
            </div><!--// .yui-gc -->
        </div><!--// hd -->

        <div id="bd">
            <div id="yui-main">
                <div class="yui-b">

                    <div class="yui-gf">
                        <div class="yui-u first">
                            <h2>Profile</h2>
                        </div>

                        <div class="yui-u">
                            <p class="enlarge">
                                ${this.appUser?.aboutMe}
                            </p>
                        </div>
                    </div><!--// .yui-gf -->

                %{--<div class="yui-gf">
                    <div class="yui-u first">
                        <h2>Skills</h2>
                    </div>

                    <div class="yui-u">

                        <div class="talent">
                            <h2>Web Design</h2>

                            <p>Assertively exploit wireless initiatives rather than synergistic core competencies.</p>
                        </div>

                        <div class="talent">
                            <h2>Interface Design</h2>

                            <p>Credibly streamline mission-critical value with multifunctional functionalities.</p>
                        </div>

                        <div class="talent">
                            <h2>Project Direction</h2>

                            <p>Proven ability to lead and manage a wide variety of design and development projects in team and independent situations.</p>
                        </div>
                    </div>
                </div><!--// .yui-gf -->--}%
                    <div class="yui-gf">

                        <div class="yui-u first">
                            <h2>Experience</h2>
                        </div><!--// .yui-u -->

                        <div class="yui-u">
                            <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

                                <g:if test="${i == this.appUser?.workExpList?.size() - 1}"><div class="job last"></g:if>
                                <g:else><div class="job"></g:else>
                                <h2>${workExpItem?.employerName}</h2>

                                <h3>${workExpItem?.title}</h3>
                                <h4><g:formatDate format="yyy-MM-dd" date="${workExpItem?.startDate}"/> to <g:if
                                        test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate
                                        format="yyy-MM-dd" date="${workExpItem?.endDate}"/></g:else></h4>

                                <p>${workExpItem?.description}</p>
                                </div>
                            </g:each>

                        </div><!--// .yui-u -->
                        </div><!--// .yui-gf -->

                        <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">

                            <div class="yui-gf">
                                <div class="yui-u first">
                                    <h2>${skillCategory?.skillCategoryName}</h2>
                                </div>


                                <div class="yui-u">

                                    <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">
                                        <g:if test="${i % 3 == 0}">
                                            <ul class="talent">
                                        </g:if>
                                        <g:if test="${(i + 1) % 3 == 0}">
                                            <li class="last">${skillItem?.skillName}</li>
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
                            </div><!--// .yui-gf-->

                        </g:each>




                        <div class="yui-gf last">
                            <div class="yui-u first">
                                <h2>Education</h2>
                            </div>


                            <div class="yui-u">
                                <g:each in="${this.appUser?.educationList}">
                                    <div class="job">
                                        <h2>${it?.name}</h2>

                                        <h3>Major, ${it?.sector}%{-- &mdash; <strong>4.0 GPA</strong>--}%</h3>
                                        <h4><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if
                                                test="${it?.current}">Current</g:if><g:else><g:formatDate
                                                format="yyy-MM-dd" date="${it?.endDate}"/></g:else></h4>

                                    </div>
                                </g:each>
                            </div>

                        </div><!--// .yui-gf -->

                    </div><!--// .yui-b -->
                </div><!--// yui-main -->
            </div><!--// bd -->

            <div id="ft">
                <p>${this.appUser?.name} ${this.appUser?.surname} &mdash; <a
                        href="mailto:${this.appUser?.email}">${this.appUser?.email}</a> &mdash; ${this.appUser?.phoneNumber}
                </p>
            </div><!--// footer -->

        </div><!-- // inner -->

    </div><!--// doc -->
</div>

<asset:javascript src="DIYResume/jquery-2.1.1.min.js"/>
<asset:javascript src="DIYResume/jQuery.print.js"/>

<g:javascript>
    $('.button_print').click(function () {
        $('.yui-t7').print({
            addGlobalStyles: true,
            mediaPrint: true
        });
    });
</g:javascript>
</body>
</html>

