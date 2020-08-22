package coolengineer.me

import javax.transaction.Transactional

//import Date

@Transactional
class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def appUserRole = new Role(authority: 'ROLE_APPUSER').save() //TODO: Define access of ROLE_APPUSER

        def testUser = new User(username: 'spirosbond', password: 'smpontom1990').save()
        def demoUser = new User(username: 'demo', password: 'smpontom1990').save()

        UserRole.create(testUser, adminRole, true)
        UserRole.create(demoUser, appUserRole, true)

        def testAppUser = new AppUser(name: 'Spiros', url: 'coolengineer.me', headline: 'The Engineer you want...', aboutMe: 'I like to work work work... I won\'t let you down. Please hire me!', surname: 'Bond', email: 'spirosbond@hotmail.com', dateOfBirth: new Date(), phoneNumber: '+306977766696', address: 'here', user: testUser).save(flush: true)
        def demoAppUser = new AppUser(name: 'John', url: 'coolengineer.me', headline: 'Electrical & Software Engineer', aboutMe: 'Progressively evolve cross-platform ideas before impactful infomediaries. Energistically visualize tactical initiatives before cross-media catalysts', surname: 'Doe', email: 'jonathan@doe.com', dateOfBirth: new Date('1990/04/21'), phoneNumber: '+1.212.541.8457', address: 'Manhattan, New York', user: demoUser).save(flush: true)

        def testResumeTheme1 = new ResumeTheme(active: false, name: 'One Page Resume', path: '/themes/OnePageResume/index.gsp', defaultPath: '/themes/OnePageResume/default/index.gsp', previewImagePath: '/OnePageResume/onepageresume-preview.png').save()
        def testResumeTheme2 = new ResumeTheme(active: false, name: 'Simple Page Resume', path: '/themes/SimplePageResume/index.gsp', defaultPath: '/themes/SimplePageResume/default/index.gsp', previewImagePath: '/SimplePageResume/simplepageresume-preview.png').save()
        def testResumeTheme3 = new ResumeTheme(name: 'DIY Resume', path: '/themes/DIYResume/index.gsp', defaultPath: '/themes/DIYResume/default/index.gsp', previewImagePath: '/DIYResume/diyresume-preview.png').save()
        def testResumeTheme4 = new ResumeTheme(name: 'Responsive CV', path: '/themes/ResponsiveCV/index.gsp', defaultPath: '/themes/ResponsiveCV/default/index.gsp', previewImagePath: '/ResponsiveCV/responsivecv-preview.png').save()
        def testResumeTheme5 = new ResumeTheme(name: 'Responsive Resume', path: '/themes/ResponsiveResume/index.gsp', defaultPath: '/themes/ResponsiveResume/default/index.gsp', previewImagePath: '/ResponsiveResume/responsiveresume-preview.png').save()
        def testResumeTheme6 = new ResumeTheme(name: 'Simple Resume', path: '/themes/SimpleResume/index.gsp', defaultPath: '/themes/SimpleResume/default/index.gsp', previewImagePath: '/SimpleResume/simpleresume-preview.png').save()
        def testResumeTheme7 = new ResumeTheme(name: 'Responsive Page Resume', path: '/themes/ResponsivePageResume/index.gsp', defaultPath: '/themes/ResponsivePageResume/default/index.gsp', previewImagePath: '/ResponsivePageResume/responsivepageresume-preview.png').save()
        def testResumeTheme8 = new ResumeTheme(name: 'Open Source Resume', path: '/themes/OpenSourceResume/index.gsp', defaultPath: '/themes/OpenSourceResume/default/index.gsp', previewImagePath: '/OpenSourceResume/opensourceresume-preview.png').save()
        def testResumeTheme9 = new ResumeTheme(name: 'Dev Page Resume', path: '/themes/DevPageResume/index.gsp', defaultPath: '/themes/DevPageResume/default/index.gsp', previewImagePath: '/DevPageResume/devpageresume-preview.png').save()

        def educationItem1 = new Education(startDate: new Date(System.currentTimeMillis()), endDate: new Date(System.currentTimeMillis()), name: 'School', sector: 'High School', appUser: testAppUser).save()
        def educationItem2 = new Education(startDate: new Date(System.currentTimeMillis()), current: true, name: 'Aristotle Uni', sector: 'E&E Eng', appUser: testAppUser).save()
        def educationItem3 = new Education(startDate: new Date(System.currentTimeMillis()), current: true, name: 'Real Life', sector: 'First world problems', appUser: testAppUser).save()

        def educationItem4 = new Education(startDate: new Date('2008/09/01'), endDate: new Date('2012/07/31'), name: 'Indiana University - Bloomington, IN', sector: 'Electrical & Computer Eng. - 4.0 GPA', appUser: demoAppUser).save()
        def educationItem5 = new Education(startDate: new Date('2005/09/01'), endDate: new Date('2008/06/15'), name: 'High School - New Jersey, NY', sector: 'Maths and Science - 3.9 GPA', appUser: demoAppUser).save()

        def skillCategoryItem1 = new SkillCategory(skillCategoryName: 'Category 1', appUser: testAppUser).save()
        def skillCategoryItem2 = new SkillCategory(skillCategoryName: 'Category 2', appUser: testAppUser).save()
        def skillCategoryItem3 = new SkillCategory(skillCategoryName: 'Category 3', appUser: testAppUser).save()

        def skillCategoryItem4 = new SkillCategory(skillCategoryName: 'Technical', appUser: demoAppUser).save()
        def skillCategoryItem5 = new SkillCategory(skillCategoryName: 'Operating Systems', appUser: demoAppUser).save()
        def skillCategoryItem6 = new SkillCategory(skillCategoryName: 'Hobbies', appUser: demoAppUser).save()

        def skillItem1 = new Skill(skillName: 'Programming', level: 4, skillCategory: skillCategoryItem1).save()
        def skillItem2 = new Skill(skillName: 'MS Office', level: 3, skillCategory: skillCategoryItem1).save()
        def skillItem3 = new Skill(skillName: 'Bullshitting', level: 5, skillCategory: skillCategoryItem1).save()
        def skillItem4 = new Skill(skillName: 'Yolo', level: 1, skillCategory: skillCategoryItem1).save()
        def skillItem5 = new Skill(skillName: 'Wherever', level: 1, skillCategory: skillCategoryItem2).save()
        def skillItem6 = new Skill(skillName: 'Whenever', level: 2, skillCategory: skillCategoryItem2).save()
        def skillItem7 = new Skill(skillName: 'We are meant to be together', level: 3, skillCategory: skillCategoryItem3).save()

        def skillItem8 = new Skill(skillName: 'XHTML', level: 3, skillCategory: skillCategoryItem4).save()
        def skillItem9 = new Skill(skillName: 'CSS', level: 4, skillCategory: skillCategoryItem4).save()
        def skillItem10 = new Skill(skillName: 'Javascript', level: 5, skillCategory: skillCategoryItem4).save()
        def skillItem11 = new Skill(skillName: 'Jquery', level: 5, skillCategory: skillCategoryItem4).save()
        def skillItem12 = new Skill(skillName: 'PHP', level: 4, skillCategory: skillCategoryItem4).save()
        def skillItem13 = new Skill(skillName: 'CVS / Subversion', level: 5, skillCategory: skillCategoryItem4).save()
        def skillItem14 = new Skill(skillName: 'OS X', level: 3, skillCategory: skillCategoryItem5).save()
        def skillItem15 = new Skill(skillName: 'Windows 10', level: 4, skillCategory: skillCategoryItem5).save()
        def skillItem16 = new Skill(skillName: 'Windows Server', level: 4, skillCategory: skillCategoryItem5).save()
        def skillItem17 = new Skill(skillName: 'Linux', level: 5, skillCategory: skillCategoryItem5).save()
        def skillItem18 = new Skill(skillName: 'Movies', level: 0, skillCategory: skillCategoryItem6).save()
        def skillItem19 = new Skill(skillName: 'Traveling', level: 0, skillCategory: skillCategoryItem6).save()
        def skillItem20 = new Skill(skillName: 'Music', level: 0, skillCategory: skillCategoryItem6).save()

        def workExpItem1 = new WorkExp(startDate: new Date(System.currentTimeMillis()), endDate: new Date(System.currentTimeMillis()), title: 'Engineer', location: 'Belgium', description: 'Close Enough Engineer', employerName: 'P&G', appUser: testAppUser).save()
        def workExpItem2 = new WorkExp(startDate: new Date(System.currentTimeMillis()), current: true, title: 'Porn Star', location: 'Balkans', description: 'Sexy ass motherfucker', employerName: 'Blue Iguana', appUser: testAppUser).save()
        def workExpItem3 = new WorkExp(startDate: new Date(System.currentTimeMillis()), endDate: new Date(System.currentTimeMillis()), title: 'NBA Player', location: 'Chicago US', description: 'MJ\'s second hand', employerName: 'Chicago Bulls', appUser: testAppUser).save()

        def workExpItem4 = new WorkExp(startDate: new Date('2019/09/01'), current: true, title: 'Lead Web Designer', location: 'New York, US', description: 'Globally re-engineer cross-media schemas through viral methods of empowerment. Proactively grow long-term high-impact human capital and highly efficient innovation. Intrinsicly iterate excellent e-tailers with timely e-markets.', employerName: 'International Business Machines (IBM)', appUser: demoAppUser).save()
        def workExpItem5 = new WorkExp(startDate: new Date('2017/06/01'), endDate: new Date('2019/08/31'), title: 'Principal and Creative Lead', location: 'Chicago, US', description: 'Intrinsicly transform flexible manufactured products without excellent intellectual capital. Energistically evisculate orthogonal architectures through covalent action items.', employerName: 'Microsoft', appUser: demoAppUser).save()
        def workExpItem6 = new WorkExp(startDate: new Date('2015/03/01'), endDate: new Date('2017/05/31'), title: 'Senior Interface Designer', location: 'California, US', description: 'Intrinsicly enable optimal core competencies through corporate relationships. Phosfluorescently implement worldwide vortals and client-focused imperatives. Conveniently initiate virtual paradigms and top-line convergence.', employerName: 'Facebook', appUser: demoAppUser).save()
        def workExpItem7 = new WorkExp(startDate: new Date('2013/01/01'), endDate: new Date('2015/02/28'), title: 'Senior Interface Designer', location: 'California, US', description: 'Progressively reconceptualize multifunctional outside the box thinking through inexpensive methods of empowerment. Compellingly morph extensive niche markets with mission-critical ideas.', employerName: 'Apple Inc.', appUser: demoAppUser).save()

        testAppUser?.addToResumeThemes(testResumeTheme3)?.addToResumeThemes(testResumeTheme9)?.save(flush: true)
        demoAppUser?.addToResumeThemes(testResumeTheme8)?.addToResumeThemes(testResumeTheme9)?.save(flush: true)

        /*javax.servlet.http.HttpServletRequest.metaClass.getSiteUrl = {
            return (delegate.scheme + "://" + delegate.serverName + ":" + delegate.serverPort + delegate.getContextPath())
        }*/

        /* UserRole.withSession {
            it.flush()
            it.clear()
        }*/

    }

    def destroy = {
    }
}
