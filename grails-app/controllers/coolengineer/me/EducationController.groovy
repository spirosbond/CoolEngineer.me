package coolengineer.me

import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_APPUSER'])
class EducationController {

    EducationService educationService

    static allowedMethods = [save: "POST", saveSilent: "POST", update: "PUT", updateSilent: ["PUT", "POST"], delete: "DELETE", deleteSilent: ["DELETE", "GET"]]

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond educationService.list(params), model: [educationCount: educationService.count()]
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond educationService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new Education(params)
    }

    def createCard() {
        respond new Education(params)
    }

    @Secured('ROLE_ADMIN')
    def save(Education education) {
        if (education == null) {
            notFound()
            return
        }

        try {
            educationService.save(education)
        } catch (ValidationException e) {
            respond education.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'education.label', default: 'Education'), education.id])
                redirect education
            }
            '*' { respond education, [status: CREATED] }
        }
    }

    def saveSilent(Education education) {
        if (education == null) {
            notFound()
            return
        }

        try {
            educationService.save(education)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.savefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: education.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'education.label', default: 'Education'), education.name])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: education.id
            }
            '*' { respond education, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond educationService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(Education education) {
        if (education == null) {
            notFound()
            return
        }

        try {
            educationService.save(education)
        } catch (ValidationException e) {
            respond education.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'education.label', default: 'Education'), education.id])
                redirect education
            }
            '*' { respond education, [status: OK] }
        }
    }

    def updateSilent(Education education) {

        if (education == null) {
            notFound()
            return
        }

        try {
            educationService.save(education)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: education.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'education.label', default: 'Education'), education.name])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: education.id
            }
            '*' { respond education, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        educationService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'education.label', default: 'Education'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    def deleteSilent(Long id) {
        if (id == null) {
            notFound()
            return
        }
        def educationItem = Education.findById(id)
        educationItem.appUser.educationList.remove(educationItem)
        educationService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'education.label', default: 'Education'), educationItem.name])
        redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: id
    }

    @Secured('permitAll')
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'education.label', default: 'Education'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
