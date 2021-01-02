package coolengineer.me

import grails.plugin.springsecurity.SpringSecurityService
import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN', 'ROLE_APPUSER'])
class AppUserController {

    AppUserService appUserService
    UserService userService
    SpringSecurityService springSecurityService
    def assetResourceLocator

    static allowedMethods = [save: "POST", saveThemeAjax: "POST", register: "POST", update: "PUT", updateSilent: ["PUT", "POST"], updateEducationList: ["PUT", "POST"], updateWorkExpList: ["PUT", "POST"], updateSkillCategoryList: ["PUT", "POST"], delete: "DELETE"]

    @Secured('permitAll')
    def showRegister() {
        if (!isLoggedIn()) {
            respond model: [appUser: new AppUser(params), user: new User(params)]
        } else {
            flash.message = message(code: 'sec.login.alreadyLoggedId')
            redirect controller: 'homepage'
        }
    }

    @Secured('permitAll')
    def register(User user, AppUser appUser) {
        print 'Trying to register: '
        println user
        println appUser
        if (user.validate()) {
            appUser.user = user
        } else {
            println user.errors
            flash.message = message(code: 'default.savefailed.message')
            user.discard()
            appUser.discard()
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: user.id
            return
        }

        if (appUser.validate()) {
            userService.save(user)
            UserRole.create(user, Role.findByAuthority('ROLE_APPUSER'), true)
            appUser.addToResumeThemes(ResumeTheme.findById(grailsApplication.config.getProperty('coolengineerme.themes.defaultThemeId')))
            appUserService.save(appUser)

        } else {
            println appUser.errors
            user.discard()
            appUser.discard()
            flash.message = message(code: 'default.savefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: appUser.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appUser.label', default: 'AppUser'), appUser.user.username])
                springSecurityService.reauthenticate(user.username)
                redirect controller: 'homepage', id: appUser.id
            }
            '*' { respond appUser, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: OK] }
        }
    }

    def showProfile(Long id) {
        if (!isLoggedIn()) {
            flash.message = message(code: 'sec.login.required')
            redirect controller: 'login'
        } else {
            def appUser = User.findByUsername(sec?.username()).appUser
            respond appUser
        }

    }

    def updateSilent(AppUser appUser) {

        if (appUser == null) {
            notFound()
            return
        }

        try {
            appUserService.save(appUser)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: appUser.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'appUser.label', default: 'AppUser'), appUser.user.username])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: appUser.id
            }
            '*' { respond appUser, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: OK] }
        }
    }

    def uploadFeaturedImage(FeaturedImageCommand cmd) {
        if (cmd == null) {
            notFound()
            return

        }
        if (cmd.hasErrors()) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: cmd.id
            return
        }
        AppUser appUser = appUserService.update(cmd.id, cmd.version, cmd.featuredImageFile.bytes, cmd.featuredImageFile.contentType)
        if (appUser == null) {
            notFound()
            return
        }
        if (appUser.hasErrors()) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: appUser.id
            return
        }
        redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: appUser.id
    }

    @Secured('permitAll')
    def featuredImage(Long id) {
        AppUser appUser = appUserService.get(id)
        if (!appUser || appUser.featuredImageBytes == null) {
            render file: assetResourceLocator.findAssetForURI('featuredImage-default.png').getInputStream().bytes, contentType: 'image/png'
            return
        }
        render file: appUser.featuredImageBytes, contentType: appUser.featuredImageContentType
    }

    def getEducationList(AppUser appUser) {

    }

    def getWorkExpList(AppUser appUser) {

    }

    def getSkillList(AppUser appuser) {
        respond model: [skill: new Skill(params)]
    }

    def getAccountInputFields(AppUser appUser) {

    }

    def getProfileInputFields(AppUser appUser) {

    }

    def getPersonalInputFields(AppUser appUser) {

    }

    def updateEducationList(AppUser appUser) {
        try {
            def oldIndex = params.get("oldIndex") as int
            def newIndex = params.get("newIndex") as int
            if (newIndex > oldIndex) {
                for (int i = oldIndex; i < newIndex; i++) {
                    Collections.swap(appUser.educationList, i, i + 1)
                    appUser.save(flush: true)
                }
            } else if (oldIndex > newIndex) {
                for (int i = oldIndex; i > newIndex; i--) {
                    Collections.swap(appUser.educationList, i, i - 1)
                    appUser.save(flush: true)
                }
            }
            render message(code: 'ajax.success') as String
        } catch (Exception e) {
            render message(code: 'ajax.failed') as String
        }
    }

    def updateWorkExpList(AppUser appUser) {
        try {
            def oldIndex = params.get("oldIndex") as int
            def newIndex = params.get("newIndex") as int
            if (newIndex > oldIndex) {
                for (int i = oldIndex; i < newIndex; i++) {
                    Collections.swap(appUser.workExpList, i, i + 1)
                    appUser.save(flush: true)
                }
            } else if (oldIndex > newIndex) {
                for (int i = oldIndex; i > newIndex; i--) {
                    Collections.swap(appUser.workExpList, i, i - 1)
                    appUser.save(flush: true)
                }
            }
            render message(code: 'ajax.success') as String
        } catch (Exception e) {
            render message(code: 'ajax.failed') as String
        }
    }

    def updateSkillCategoryList(AppUser appUser) {
        try {
            def oldIndex = params.get("oldIndex") as int
            def newIndex = params.get("newIndex") as int
            if (newIndex > oldIndex) {
                for (int i = oldIndex; i < newIndex; i++) {
                    Collections.swap(appUser.skillCategoryList, i, i + 1)
                    appUser.save(flush: true)
                }
            } else if (oldIndex > newIndex) {
                for (int i = oldIndex; i > newIndex; i--) {
                    Collections.swap(appUser.skillCategoryList, i, i - 1)
                    appUser.save(flush: true)
                }
            }
            render message(code: 'ajax.success') as String
        } catch (Exception e) {
            render message(code: 'ajax.failed') as String
        }
    }

    def saveTheme(AppUser appUser) {
        ResumeTheme resumeTheme = ResumeTheme.findById(Long.parseLong(params.themeId))
        appUser.removeFromResumeThemes(resumeTheme)
        appUser.addToResumeThemes(resumeTheme).save(flush: true)
        redirect uri: request.getHeader('referer'), model: [appUser: appUser]
    }

    def saveThemeAjax(AppUser appUser) {
        try {
            ResumeTheme resumeTheme = ResumeTheme.findById(Long.parseLong(params.themeId))
            appUser.removeFromResumeThemes(resumeTheme)
            appUser.addToResumeThemes(resumeTheme).save(flush: true)
            render message(code: 'ajax.success') as String
        } catch (Exception e) {
            render message(code: 'ajax.failed') as String
        }
    }

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond appUserService.list(params), model: [appUserCount: appUserService.count()]
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond appUserService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new AppUser(params)
    }

    @Secured('ROLE_ADMIN')
    def save(AppUser appUser) {
        if (appUser == null) {
            notFound()
            return
        }

        try {
            appUserService.save(appUser)
        } catch (ValidationException e) {
            respond appUser.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'appUser.label', default: 'AppUser'), appUser.id])
                redirect appUser
            }
            '*' { respond appUser, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond appUserService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(AppUser appUser) {
        if (appUser == null) {
            notFound()
            return
        }

        try {
            appUserService.save(appUser)
        } catch (ValidationException e) {
            respond appUser.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'appUser.label', default: 'AppUser'), appUser.id])
                redirect appUser
            }
            '*' { respond appUser, [status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        appUserService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'appUser.label', default: 'AppUser'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Secured('permitAll')
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'appUser.label', default: 'AppUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
