package coolengineer.me

import grails.validation.ValidationException
import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN','ROLE_APPUSER'])
class SkillCategoryController {

    SkillCategoryService skillCategoryService

    static allowedMethods = [save: "POST", saveSilent: "POST", update: "PUT", updateSilent: ["PUT", "POST"], updateSkillList: ["PUT", "POST"], delete: "DELETE", deleteSilent: ["DELETE", "GET"]]

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond skillCategoryService.list(params), model: [skillCategoryCount: skillCategoryService.count()]
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond skillCategoryService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new SkillCategory(params)
    }

    def createCollection() {
        respond model: [skillCategory: new SkillCategory(params)]
    }

    def updateSkillList(SkillCategory skillCategory) {
        try {
            def oldIndex = params.get("oldIndex") as int
            def newIndex = params.get("newIndex") as int
            if (newIndex > oldIndex) {
                for (int i = oldIndex; i < newIndex; i++) {
                    Collections.swap(skillCategory.skillList, i, i + 1)
                    skillCategory.save(flush: true)
                }
            } else if (oldIndex > newIndex) {
                for (int i = oldIndex; i > newIndex; i--) {
                    Collections.swap(skillCategory.skillList, i, i - 1)
                    skillCategory.save(flush: true)
                }
            }
            render message(code: 'ajax.success') as String
        } catch (Exception e) {
            render message(code: 'ajax.failed') as String
        }
    }

    @Secured('ROLE_ADMIN')
    def save(SkillCategory skillCategory) {
        if (skillCategory == null) {
            notFound()
            return
        }

        try {
            skillCategoryService.save(skillCategory)
        } catch (ValidationException e) {
            respond skillCategory.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), skillCategory.id])
                redirect skillCategory
            }
            '*' { respond skillCategory, [status: CREATED] }
        }
    }

    def saveSilent(SkillCategory skillCategory) {
        if (skillCategory == null) {
            notFound()
            return
        }

        try {
            skillCategoryService.save(skillCategory)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.savefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skillCategory.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), skillCategory.skillCategoryName])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skillCategory.id
            }
            '*' { respond skillCategory, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond skillCategoryService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(SkillCategory skillCategory) {
        if (skillCategory == null) {
            notFound()
            return
        }

        try {
            skillCategoryService.save(skillCategory)
        } catch (ValidationException e) {
            respond skillCategory.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), skillCategory.id])
                redirect skillCategory
            }
            '*' { respond skillCategory, [status: OK] }
        }
    }

    def updateSilent(SkillCategory skillCategory) {
        if (skillCategory == null) {
            notFound()
            return
        }

        try {
            skillCategoryService.save(skillCategory)
        } catch (ValidationException e) {
            flash.message = message(code: 'default.updatefailed.message')
            redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skillCategory.id
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), skillCategory.skillCategoryName])
                redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: skillCategory.id
            }
            '*' { respond skillCategory, [uri: request.getHeader('referer').concat(params.tabId ?: ''), status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        skillCategoryService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), id])
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
        def skillCategotyItem = SkillCategory.findById(id)
        skillCategotyItem.appUser.skillCategoryList.remove(skillCategotyItem)
        skillCategoryService.delete(id)
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), skillCategotyItem.skillCategoryName])
        redirect uri: request.getHeader('referer').concat(params.tabId ?: ''), id: id
    }

    @Secured('permitAll')
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'skillCategory.label', default: 'SkillCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
