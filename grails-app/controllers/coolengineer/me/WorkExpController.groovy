package coolengineer.me

import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_APPUSER'])
class WorkExpController {

    WorkExpService workExpService

    static allowedMethods = [save: "POST", saveSilent: "POST", update: "PUT", updateSilent: ["PUT", "POST"], delete: "DELETE", deleteSilent: ["DELETE", "GET"]]

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond workExpService.list(params), model: [workExpCount: workExpService.count()]
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond workExpService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new WorkExp(params)
    }

    def createCard() {
        respond new WorkExp(params)
    }

    @Secured('ROLE_ADMIN')
    def save(WorkExp workExp) {
        if (workExp == null) {
            notFound()
            return
        }

        try {
            workExpService.save(workExp)
        } catch (ValidationException e) {
            respond workExp.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'workExp.label', default: 'WorkExp'), workExp.id])
                redirect workExp
            }
            '*' { respond workExp, [status: CREATED] }
        }
    }

    def saveSilent(WorkExp workExp) {
        if (workExp == null) {
            notFound()
            return
        }

        try {
            workExpService.save(workExp)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.savefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: workExp.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'workExp.label', default: 'WorkExp'), workExp.title])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: workExp.id
            }
            '*' { respond workExp, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond workExpService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(WorkExp workExp) {
        if (workExp == null) {
            notFound()
            return
        }

        try {
            workExpService.save(workExp)
        } catch (ValidationException e) {
            respond workExp.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'workExp.label', default: 'WorkExp'), workExp.id])
                redirect workExp
            }
            '*' { respond workExp, [status: OK] }
        }
    }

    def updateSilent(WorkExp workExp) {
        if (workExp == null) {
            notFound()
            return
        }

        try {
            workExpService.save(workExp)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: workExp.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'workExp.label', default: 'WorkExp'), workExp.title])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: workExp.id
            }
            '*' { respond workExp, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        workExpService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'workExp.label', default: 'WorkExp'), id])
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
        def workExpItem = WorkExp.findById(id)
        workExpItem.appUser.workExpList.remove(workExpItem)
        workExpService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'workExp.label', default: 'WorkExp'), workExpItem.title])
        redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: id
    }

    @Secured('permitAll')
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'workExp.label', default: 'WorkExp'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
