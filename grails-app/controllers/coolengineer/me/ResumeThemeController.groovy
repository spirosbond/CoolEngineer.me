package coolengineer.me

import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured('ROLE_ADMIN')
class ResumeThemeController {

    ResumeThemeService resumeThemeService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond resumeThemeService.list(params), model:[resumeThemeCount: resumeThemeService.count()]
    }

    @Secured('permitAll')
    def getResumeThemeList(){
        println params
        respond ResumeTheme.findAllByActive(params.active, params)
    }

    def show(Long id) {
        respond resumeThemeService.get(id)
    }

    def create() {
        respond new ResumeTheme(params)
    }

    def save(ResumeTheme resumeTheme) {
        if (resumeTheme == null) {
            notFound()
            return
        }

        try {
            resumeThemeService.save(resumeTheme)
        } catch (ValidationException e) {
            respond resumeTheme.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'resumeTheme.label', default: 'ResumeTheme'), resumeTheme.id])
                redirect resumeTheme
            }
            '*' { respond resumeTheme, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond resumeThemeService.get(id)
    }

    def update(ResumeTheme resumeTheme) {
        if (resumeTheme == null) {
            notFound()
            return
        }

        try {
            resumeThemeService.save(resumeTheme)
        } catch (ValidationException e) {
            respond resumeTheme.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'resumeTheme.label', default: 'ResumeTheme'), resumeTheme.id])
                redirect resumeTheme
            }
            '*'{ respond resumeTheme, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        resumeThemeService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'resumeTheme.label', default: 'ResumeTheme'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'resumeTheme.label', default: 'ResumeTheme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
