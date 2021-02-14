%{--Source: https://templatemag.com/kelvin-bootstrap-resume-template/--}%
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>${this.appUser?.name} ${this.appUser?.surname} Resume</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  %{--  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">--}%
  <asset:link rel="icon" type="image/png" href="KelvinResume/apple-touch-icon.png" rel="apple-touch-icon"/>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic|Raleway:400,300,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  %{--  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">--}%
  <asset:stylesheet src="KelvinResume/bootstrap.min.css"/>

  <!-- Libraries CSS Files -->
  %{--  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">--}%
  <asset:stylesheet src="KelvinResume/font-awesome.min.css"/>

  <!-- Main Stylesheet File -->
  %{--  <link href="css/style.css" rel="stylesheet">--}%
  <asset:stylesheet src="KelvinResume/style.css"/>

  <!-- =======================================================
    Template Name: Kelvin
    Template URL: https://templatemag.com/kelvin-bootstrap-resume-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body data-spy="scroll" data-offset="64" data-target="#section-topbar">

%{--  <div id="section-topbar">--}%
%{--    <div id="topbar-inner">--}%
%{--      <div class="container">--}%
%{--        <div class="row">--}%
%{--          <div class="dropdown">--}%
%{--            <ul id="nav" class="nav">--}%
%{--              <li class="menu-item"><a class="smothscroll" href="#about" title="About"><i class="fa fa-user"></i></a></li>--}%
%{--              <li class="menu-item"><a class="smothscroll" href="#resume" title="Resume"><i class="fa fa-file-text-o"></i></a></li>--}%
%{--              <li class="menu-item"><a class="smothscroll" href="#work" title="Works"><i class="fa fa-briefcase"></i></a></li>--}%
%{--              <li class="menu-item"><a class="smothscroll" href="#contact" title="Contact"><i class="fa fa-envelope"></i></a></li>--}%
%{--            </ul>--}%
%{--            <!--/ uL#nav -->--}%
%{--          </div>--}%
%{--          <!-- /.dropdown -->--}%

%{--          <div class="clear"></div>--}%
%{--        </div>--}%
%{--        <!--/.row -->--}%
%{--      </div>--}%
%{--      <!--/.container -->--}%

%{--      <div class="clear"></div>--}%
%{--    </div>--}%
%{--    <!--/ #topbar-inner -->--}%
%{--  </div>--}%
<!--/ #section-topbar -->

<div id="headerwrap" style="margin-top: 0;background: url(/assets/KelvinResume/header-background-carbon.jpg) no-repeat center top;">
  <div class="container">
    <div class="row centered">
      <div class="col-lg-12">
        <h1>${this.appUser?.name} ${this.appUser?.surname}</h1>
        <h3>${this.appUser?.headline} | ${this.appUser?.email}</h3>
      </div>
      <!--/.col-lg-12 -->
    </div>
    <!--/.row -->
  </div>
  <!--/.container -->
</div>
<!--/.#headerwrap -->


<section id="about" name="about">
  <div id="intro">
    <div class="container">
      <div class="row">

        <div class="col-lg-2 col-lg-offset-1">
          <h5>ABOUT</h5>
        </div>
        <div class="col-lg-6">
          <p>${this.appUser?.aboutMe}</p>
        </div>
        %{--          <div class="col-lg-3">--}%
        %{--            <p><a href="#"><i class="icon-file"></i></a>--}%
        %{--              <sm>DOWNLOAD PDF</sm>--}%
        %{--            </p>--}%
        %{--          </div>--}%

      </div>
      <!--/.row -->
    </div>
    <!--/.container -->
  </div>
  <!--/ #intro -->
</section>


<section id="resume" name="resume">
  <!--EDUCATION DESCRIPTION -->
  <div class="container desc">
    <div class="row">

      <div class="col-lg-2 col-lg-offset-1">
        <h5>EDUCATION</h5>
      </div>

      <div class="col-lg-9">
        <g:each in="${this.appUser?.educationList}">
          <div class="row">
            <div class="col-lg-8">
              <p>
                <t>${it?.sector}</t><br/> ${it?.name} <br/>
                %{--                <i>2 Years Course</i>--}%
              </p>
            </div>
            <div class="col-lg-4" style="text-transform: uppercase;">
              <p>
                <sm><g:formatDate format="MMM yyyy" date="${it?.startDate}"/> - <g:if
                        test="${it?.current}">CURRENT</g:if><g:else><g:formatDate
                        format="MMM yyyy" date="${it?.endDate}"/></g:else></sm>
              </p>
            </div>
          </div>
        </g:each>
      </div>

      %{--      <div class="col-lg-6">--}%
      %{--        <p>--}%
      %{--          <t>Master of Web Design</t><br/> St. Patrick University <br/>--}%
      %{--          <i>3 Years Course</i>--}%
      %{--        </p>--}%
      %{--      </div>--}%
      %{--      <div class="col-lg-3">--}%
      %{--        <p>--}%
      %{--          <sm>GRADUATING IN MAY 2014</sm><br/>--}%
      %{--          <imp>--}%
      %{--            <sm>IN PROGRESS</sm>--}%
      %{--          </imp>--}%
      %{--        </p>--}%
      %{--      </div>--}%

      %{--      <div class="col-lg-6 col-lg-offset-3">--}%
      %{--        <p>--}%
      %{--          <t>Degree of Web Developer</t><br/> Hastings University <br/>--}%
      %{--          <i>2 Years Course</i>--}%
      %{--        </p>--}%
      %{--      </div>--}%
      %{--      <div class="col-lg-3">--}%
      %{--        <p>--}%
      %{--          <sm>JUNE 2012</sm>--}%
      %{--        </p>--}%
      %{--      </div>--}%

    </div>
    <!--/.row -->
    <br>
    <hr>
  </div>
  <!--/.container -->
</section>


<!--WORK DESCRIPTION -->
<div class="container desc">
  <div class="row">

    <div class="col-lg-2 col-lg-offset-1">
      <h5>WORK</h5>
    </div>

    <div class="col-lg-9">
      <g:each in="${this.appUser?.workExpList}" var="workExpItem" status="i">
        <div class="row">
          <div class="col-lg-8">
            <p>
              <t>${workExpItem?.title}</t><br/> ${workExpItem?.employerName} <br/>
            </p>
            <p>
              <more>${workExpItem?.description}</more>
            </p>
          </div>
          <div class="col-lg-4" style="text-transform: uppercase;">
            <p>
              <sm><g:formatDate format="MMM yyyy" date="${workExpItem?.startDate}"/> - <g:if
                      test="${workExpItem?.current}">CURRENT</g:if><g:else><g:formatDate format="MMM yyyy" date="${workExpItem?.endDate}"/></g:else></sm>
            </p>
          </div>
        </div>
      </g:each>
    </div>

    %{--    <div class="col-lg-6">--}%
    %{--      <p>--}%
    %{--        <t>Front-end Developer</t><br/> Example Corp. <br/>--}%
    %{--      </p>--}%
    %{--      <p>--}%
    %{--        <more>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</more>--}%
    %{--      </p>--}%
    %{--    </div>--}%
    %{--    <div class="col-lg-3">--}%
    %{--      <p>--}%
    %{--        <sm>AUGUST 2012 - CURRENT</sm>--}%
    %{--      </p>--}%
    %{--    </div>--}%

    %{--    <div class="col-lg-6 col-lg-offset-3">--}%
    %{--      <p>--}%
    %{--        <t>Web Designer - Intern</t><br/> Onassis Ltd. <br/>--}%
    %{--      </p>--}%
    %{--      <p>--}%
    %{--        <more>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</more>--}%
    %{--      </p>--}%
    %{--    </div>--}%
    %{--    <div class="col-lg-3">--}%
    %{--      <p>--}%
    %{--        <sm>JUNE 2010 - JULY 2012</sm>--}%
    %{--      </p>--}%
    %{--    </div>--}%
  </div>
  <!--/.row -->
  <br>
  <hr>
</div>
<!--/.container -->


<!--AWARDS DESCRIPTION -->
%{--<div class="container desc">--}%
%{--  <div class="row">--}%
%{--    <div class="col-lg-2 col-lg-offset-1">--}%
%{--      <h5>AWARDS</h5>--}%
%{--    </div>--}%
%{--    <div class="col-lg-6">--}%
%{--      <p>--}%
%{--        <t>Best Web Design</t><br/> Example Site <br/>--}%
%{--      </p>--}%
%{--    </div>--}%
%{--    <div class="col-lg-3">--}%
%{--      <p>--}%
%{--        <sm>NOVEMBER 2013</sm>--}%
%{--      </p>--}%
%{--    </div>--}%

%{--    <div class="col-lg-6 col-lg-offset-3">--}%
%{--      <p>--}%
%{--        <t>Designer of the Year</t><br/> Awwwards Site--}%
%{--      </p>--}%
%{--      <p>--}%
%{--        <more>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</more>--}%
%{--      </p>--}%
%{--    </div>--}%
%{--    <div class="col-lg-3">--}%
%{--      <p>--}%
%{--        <sm>2013</sm>--}%
%{--      </p>--}%
%{--    </div>--}%

%{--  </div>--}%
%{--  <!--/.row -->--}%
%{--  <br>--}%
%{--</div>--}%
<!--/.container -->


<!--SKILLS DESCRIPTION -->
<div id="skillswrap">
  <div class="container">
    <div class="row">
      <div class="col-lg-2 col-lg-offset-1">
        <h5>SKILLS</h5>
      </div>

      <div class="col-lg-9">
        <g:each in="${this.appUser?.skillCategoryList}" var="skillCategory" status="i">
          <div class="row">

            <h5><strong>${skillCategory?.skillCategoryName}</strong></h5>
            <g:each in="${skillCategory?.skillList}" var="skillItem">
              <div class="col-lg-3 centered">
                <g:if test="${skillItem?.level > 0}">
                  <canvas id="skill-${skillItem?.id}" height="130" width="130"></canvas>
                </g:if>
                <p>${skillItem?.skillName}</p>
                <br>
              </div>
            </g:each>
          </div>
        </g:each>
      </div>


      %{--      <div class="col-lg-3 centered">--}%
      %{--        <canvas id="javascript" height="130" width="130"></canvas>--}%
      %{--        <p>Javascript</p>--}%
      %{--        <br>--}%
      %{--      </div>--}%
      %{--      <div class="col-lg-3 centered">--}%
      %{--        <canvas id="bootstrap" height="130" width="130"></canvas>--}%
      %{--        <p>Bootstrap</p>--}%
      %{--        <br>--}%
      %{--      </div>--}%
      %{--      <div class="col-lg-3 centered">--}%
      %{--        <canvas id="wordpress" height="130" width="130"></canvas>--}%
      %{--        <p>Wordpress</p>--}%
      %{--        <br>--}%
      %{--      </div>--}%

      %{--      <div class="col-lg-3 col-lg-offset-3 centered">--}%
      %{--        <canvas id="html" height="130" width="130"></canvas>--}%
      %{--        <p>HTML/CSS</p>--}%
      %{--        <br>--}%
      %{--      </div>--}%
      %{--      <div class="col-lg-3 centered">--}%
      %{--        <canvas id="photoshop" height="130" width="130"></canvas>--}%
      %{--        <p>Photoshop</p>--}%
      %{--        <br>--}%
      %{--      </div>--}%
      %{--      <div class="col-lg-3 centered">--}%
      %{--        <canvas id="illustrator" height="130" width="130"></canvas>--}%
      %{--        <p>Illustrator</p>--}%
      %{--        <br>--}%
      %{--      </div>--}%

    </div>
    <!--/.row -->
    <br>
  </div>
  <!--/.container -->
</div>
<!--/ #skillswrap -->



%{--<section id="work" name="work">--}%
%{--  <!--PORTFOLIO DESCRIPTION -->--}%
%{--  <div class="container desc">--}%
%{--    <div class="row">--}%
%{--      <div class="col-lg-2 col-lg-offset-1">--}%
%{--        <h5>PORTFOLIO</h5>--}%
%{--      </div>--}%
%{--      <div class="col-lg-6">--}%
%{--        <p>--}%
%{--          --}%%{--            <img class="img-responsive" src="img/port01.jpg" alt="">--}%
%{--          <asset:image class="img-responsive" src="KelvinResume/port01.jpg" alt=""/>--}%
%{--        </p>--}%
%{--      </div>--}%
%{--      <div class="col-lg-3">--}%
%{--        <p>CANALS OF ENGLAND</p>--}%
%{--        <p>--}%
%{--          <more>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br/><br/>--}%
%{--            <sm><i class="icon-tag"></i> design</sm>--}%
%{--          </more>--}%
%{--        </p>--}%
%{--      </div>--}%

%{--      <div class="col-lg-6 col-lg-offset-3">--}%
%{--        <p>--}%
%{--          --}%%{--            <img class="img-responsive" src="img/port02.jpg" alt="">--}%
%{--          <asset:image class="img-responsive" src="KelvinResume/port02.jpg" alt=""/>--}%
%{--        </p>--}%
%{--      </div>--}%
%{--      <div class="col-lg-3">--}%
%{--        <p>SANKEY</p>--}%
%{--        <p>--}%
%{--          <more>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br/><br/>--}%
%{--            <sm><i class="icon-tag"></i> front-end</sm>--}%
%{--          </more>--}%
%{--        </p>--}%
%{--      </div>--}%

%{--      <div class="col-lg-6 col-lg-offset-3">--}%
%{--        <p>--}%
%{--          --}%%{--            <img class="img-responsive" src="img/port03.jpg" alt="">--}%
%{--          <asset:image class="img-responsive" src="KelvinResume/port03.jpg" alt=""/>--}%
%{--        </p>--}%
%{--      </div>--}%
%{--      <div class="col-lg-3">--}%
%{--        <p>WE GROW</p>--}%
%{--        <p>--}%
%{--          <more>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br/><br/>--}%
%{--            <sm><i class="icon-tag"></i> web design</sm>--}%
%{--          </more>--}%
%{--        </p>--}%
%{--      </div>--}%

%{--    </div>--}%
%{--    <!--/.row -->--}%
%{--    <br>--}%
%{--    <br>--}%
%{--  </div>--}%
%{--  <!--/.container -->--}%
%{--</section>--}%

<section id="contact" name="contact">
  <!--FOOTER DESCRIPTION -->
  <div id="footwrap">
    <div class="container">
      <div class="row">

        <div class="col-lg-2 col-lg-offset-1">
          <h5>CONTACT</h5>
        </div>
        <div class="col-lg-2">
          <p>
            <t>Email</t><br/>${this.appUser?.email}<br/>
          </p>
        </div>
        <div class="col-lg-3">
          <p>
            <t>Adress</t><br/>${this.appUser?.address}<br/>
          </p>
        </div>
        <div class="col-lg-2">
          <p>
            <t>Phone</t><br/>${this.appUser?.phoneNumber}<br/>
          </p>
        </div>
        <div class="col-lg-1">
          <p>
            <t>Links</t><br/>
            <a href="http://${this.appUser?.url}" target="_blank"><i class="fa fa-globe"></i></a>
            %{--            <a href="#"><i class="fa fa-dribbble"></i></a>--}%
            %{--            <a href="#"><i class="fa fa-twitter"></i></a>--}%
            %{--            <a href="#"><i class="fa fa-facebook"></i></a>--}%
            %{--            <a href="#"><i class="fa fa-linkedin"></i></a>--}%
            %{--            <a href="#"><i class="fa fa-apple"></i></a>--}%
          </p>
        </div>
      </div>
      %{--        <div class="col-lg-6">--}%
      %{--          <p>--}%
      %{--            <sm>CONTACT FORM</sm>--}%
      %{--          </p>--}%
      %{--          <form class="contact-form php-mail-form" role="form" action="contactform/contactform.php" method="POST">--}%

      %{--            <div class="form-group">--}%
      %{--              <label for="contact-name">Your Name</label>--}%
      %{--              <input type="name" name="name" class="form-control" id="contact-name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">--}%
      %{--              <div class="validate"></div>--}%
      %{--            </div>--}%
      %{--            <div class="form-group">--}%
      %{--              <label for="contact-email">Your Email</label>--}%
      %{--              <input type="email" name="email" class="form-control" id="contact-email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">--}%
      %{--              <div class="validate"></div>--}%
      %{--            </div>--}%
      %{--            <div class="form-group">--}%
      %{--              <label for="contact-subject">Subject</label>--}%
      %{--              <input type="text" name="subject" class="form-control" id="contact-subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">--}%
      %{--              <div class="validate"></div>--}%
      %{--            </div>--}%

      %{--            <div class="form-group">--}%
      %{--              <label for="contact-message">Your Message</label>--}%
      %{--              <textarea class="form-control" name="message" id="contact-message" placeholder="Your Message" rows="5" data-rule="required" data-msg="Please write something for us"></textarea>--}%
      %{--              <div class="validate"></div>--}%
      %{--            </div>--}%

      %{--            <div class="loading"></div>--}%
      %{--            <div class="error-message"></div>--}%
      %{--            <div class="sent-message">Your message has been sent. Thank you!</div>--}%

      %{--            <div class="form-send">--}%
      %{--              <button type="submit" class="btn btn-large">Send Message</button>--}%
      %{--            </div>--}%

      %{--          </form>--}%

      %{--        </div>--}%
    </div>
    <!--/.row -->
  </div>
  <!--/.container -->
</div>
  <!--/ #footer -->
</section>

<div id="copyrights">
  <div class="container">
    <p>
      © ${Calendar.getInstance().get(Calendar.YEAR)} IsLinked.me
    </p>
    <div class="credits">
      <!--
          You are NOT allowed to delete the credit link to TemplateMag with free version.
          You can delete the credit link only if you bought the pro version.
          Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/kelvin-bootstrap-resume-template/
          Licensing information: https://templatemag.com/license/
        -->
      Created with Kelvin template by <a href="https://templatemag.com/">TemplateMag</a>
    </div>
  </div>
</div>

<!-- JavaScript Libraries -->
%{--  <script src="lib/jquery/jquery.min.js"></script>--}%
<asset:javascript src="KelvinResume/jquery.min.js"/>
%{--  <script src="lib/bootstrap/js/bootstrap.min.js"></script>--}%
<asset:javascript src="KelvinResume/bootstrap.min.js"/>
%{--  <script src="lib/php-mail-form/validate.js"></script>--}%
<asset:javascript src="KelvinResume/validate.js"/>
%{--  <script src="lib/chart/chart.js"></script>--}%
<asset:javascript src="KelvinResume/chart.js"/>
%{--  <script src="lib/easing/easing.min.js"></script>--}%
<asset:javascript src="KelvinResume/easing.min.js"/>
<!-- Template Main Javascript File -->
%{--  <script src="js/main.js"></script>--}%
<asset:javascript src="KelvinResume/main.js"/>

<g:each in="${this.appUser?.skillCategoryList}" var="skillCategory" status="i">
  <g:each in="${skillCategory?.skillList}" var="skillItem">
    <g:javascript>
      var level = ${skillItem.level}*20;
        if (level>0){
            var doughnutData = [
              {
                value: level,
                color: "#1abc9c"
              },
              {
                value: 100-level,
                color: "#ecf0f1"
              }
            ];
            var myDoughnut = new Chart(document.getElementById("skill-${skillItem.id}").getContext("2d")).Doughnut(doughnutData);
        }
    </g:javascript>
  </g:each>
</g:each>
</body>
</html>