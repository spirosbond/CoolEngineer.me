package coolengineer.me

import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_APPUSER'])
class SkillController {

    SkillService skillService

    static allowedMethods = [save: "POST", saveSilent: "POST", update: "PUT", updateSilent: ["PUT", "POST"], delete: "DELETE", deleteSilent: ["DELETE", "GET"]]

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond skillService.list(params), model: [skillCount: skillService.count()]
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond skillService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new Skill(params)
    }

    @Secured('ROLE_ADMIN')
    def save(Skill skill) {
        if (skill == null) {
            notFound()
            return
        }

        try {
            skillService.save(skill)
        } catch (ValidationException e) {
            respond skill.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'skill.label', default: 'Skill'), skill.id])
                redirect skill
            }
            '*' { respond skill, [status: CREATED] }
        }
    }

    def saveSilent(Skill skill) {
        if (skill == null) {
            notFound()
            return
        }

        try {
            skillService.save(skill)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.savefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skill.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'skill.label', default: 'Skill'), skill.skillName])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skill.id
            }
            '*' { respond skill, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond skillService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(Skill skill) {
        if (skill == null) {
            notFound()
            return
        }

        try {
            skillService.save(skill)
        } catch (ValidationException e) {
            respond skill.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'skill.label', default: 'Skill'), skill.id])
                redirect skill
            }
            '*' { respond skill, [status: OK] }
        }
    }

    def updateSilent(Skill skill) {
        if (skill == null) {
            notFound()
            return
        }

        try {
            skillService.save(skill)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skill.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'skill.label', default: 'Skill'), skill.skillName])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skill.id

            }
            '*' { respond skill, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        skillService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'skill.label', default: 'Skill'), id])
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
        def skill = Skill.findById(id)
        skill.skillCategory.skillList.remove(skill)
        skillService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'skill.label', default: 'Skill'), skill.skillName])
        redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: id
    }

    @Secured('permitAll')
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'skill.label', default: 'Skill'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
