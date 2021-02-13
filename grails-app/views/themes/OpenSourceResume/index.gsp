<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no,minimal-ui"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="keywords" content="IsLinked.me"/>
    <meta name="description" content="Cool Engineer Resume"/>

    <asset:link rel="apple-touch-icon-precomposed" href="OpenSourceResume/apple-touch-icon-precomposed.png"/>
    <!--loading css-->
    <asset:stylesheet src="OpenSourceResume/pace-theme-flash.css" type="text/css"/>

    <asset:stylesheet src="OpenSourceResume/style.css" rel="stylesheet"/>

    <asset:stylesheet src="OpenSourceResume/responsive.css" rel="stylesheet"/>

    <asset:stylesheet src="OpenSourceResume/font.css" rel="stylesheet" type="text/css"/>

    <title>${this.appUser?.name} ${this.appUser?.surname}</title>
</head>

<body>

<!--print button-->
<a href="javascript:;" class="r5 button_print btn_green">Print</a>

<div class="main">
    <div class="content">

        <!--header-->
        <div class="header clearfix">
            <div class="avatar">
                <a href="javascript:;" class="avatar_pic circle"
                   style="background: url(<g:createLink controller="appUser" action="featuredImage"
                                                        id="${this.appUser?.id}"/>) no-repeat center/150px"><em
                        class="circle doing">More Info</em></a>
            </div>

            <div class="base">
                <p class="desc">Hello my name is</p>

                <h2>${this.appUser?.name} ${this.appUser?.surname}</h2>

                <p>${this.appUser?.headline}</p>
                <span>
                    <p><i aria-hidden="true" data-icon="&#xe01d;"></i>${this.appUser?.address}</p>

                    <p><a href="javascript:;" class="tel_me"><i aria-hidden="true"
                                                                data-icon="&#xe00b;"></i>${this.appUser?.phoneNumber}
                    </a></p>
                </span>
            </div>
        </div>

        <!--information-->
        <div class="information clearfix">

            <!--left-->
            <div class="info_area info_left info_content">

                <h5><i aria-hidden="true" data-icon="&#x70;"></i>About me</h5>

                <p class="desc">${this.appUser?.aboutMe}</p>

                <h5><i aria-hidden="true" data-icon="&#x7d;"></i>Education</h5>
                <ul>
                    <g:each in="${this.appUser?.educationList}">

                        <li class="clearfix">
                            <div class="con">
                                <h3><i aria-hidden="true" data-icon="&#x5b;"></i>${it?.name}<em>(${it?.sector})</em>
                                </h3>

                                <p><g:formatDate format="yyy-MM-dd" date="${it?.startDate}"/> to <g:if
                                        test="${it?.current}">Current</g:if><g:else><g:formatDate format="yyy-MM-dd"
                                                                                                  date="${it?.endDate}"/></g:else></p>
                            </div>
                        </li>
                    </g:each>

                </ul>

            </div>

            <!--right-->
            <div class="info_area info_right info_timeline">
                <h5><i aria-hidden="true" data-icon="&#xe021;"></i>Work Experience</h5>
                <ul>
                    <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">

                        <li class="clearfix top" id="s${i}">
                            <div class="dot"><b></b></div>

                            <div class="con">
                                <h3>${workExpItem?.employerName}</h3>

                                <p>${workExpItem?.title}</p>

                                <p class="desc"><g:formatDate format="yyy-MM-dd"
                                                              date="${workExpItem?.startDate}"/> to <g:if
                                        test="${workExpItem?.current}">Current</g:if><g:else><g:formatDate
                                        format="yyy-MM-dd" date="${workExpItem?.endDate}"/></g:else></p>
                            </div>
                        </li>
                    </g:each>

                </ul>

                <h5><i aria-hidden="true" data-icon="&#xe031;"></i>Skills</h5>
                <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory">

                    <dl class="clearfix">
                        <dt><h6><i aria-hidden="true" data-icon="&#x3d;"></i>${skillCategory?.skillCategoryName}<h6>
                        </dt>
                        <dd></dd>
                    </dl>
                    <g:each in="${skillCategory?.skillList}" var="skillItem" status="i">
                        <dl class="clearfix">

                            <dt>${skillItem?.skillName}</dt>
                            <dd>
                                <g:if test="${skillItem?.level != 0}">
                                    <g:each in="${(1..5)}" var="level">
                                        <g:if test="${skillItem?.level >= level}">
                                            <b></b>
                                        </g:if>
                                        <g:else>
                                            <em></em>
                                        </g:else>
                                    </g:each>
                                </g:if>
                            </dd>
                        </dl>
                    </g:each>
                </g:each>

            </div>

        </div>

    </div>
</div>

<div class="footer clearfix">
    Powered By IsLinked.me
    <a href="http://${grailsApplication?.config?.myserver?.url}"
       target="_blank">Join and Create your own online resume</a>
</div>

<div class="tip_avatar">
    <a href="javascript:;" class="tip_close" aria-hidden="true" data-icon="&#x4d;"></a>

    <div class="tip_avatar_con">
        <div class="tip_right">
            <p class="en mt">Hello my name is</p>

            <h2>${this.appUser?.name} ${this.appUser?.surname}</h2>

            <p>${this.appUser?.headline}</p>

            <p class="mt20">Contact details</p>

            <p><i aria-hidden="true" data-icon="&#xe010;"></i>${this.appUser?.email}</p>

            <p><i aria-hidden="true" data-icon="&#xe00b;"></i>${this.appUser?.phoneNumber}</p>

            <p><i aria-hidden="true" data-icon="&#xe0e3;"></i>${this.appUser?.url}</p>

        </div>
    </div>
</div>

<div class="tip_avatar_bg"></div>

<div class="bye"><span>Buy</span></div>

<asset:javascript src="jquery-3.3.1.min.js"/>

<asset:javascript src="OpenSourceResume/jQuery.print.js"/>

<asset:javascript src="OpenSourceResume/jquery.transit.min.js"/>

<asset:javascript src="OpenSourceResume/carousel.min.js"/>

%{--<asset:javascript src="OpenSourceResume/annyang.min.js"/>--}%

<asset:javascript src="OpenSourceResume/pace.min.js"/>

<asset:javascript src="OpenSourceResume/common.js"/>

</body>
</html>
