package coolengineer.me

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class SkillCategoryServiceSpec extends Specification {

    SkillCategoryService skillCategoryService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new SkillCategory(...).save(flush: true, failOnError: true)
        //new SkillCategory(...).save(flush: true, failOnError: true)
        //SkillCategory skillCategory = new SkillCategory(...).save(flush: true, failOnError: true)
        //new SkillCategory(...).save(flush: true, failOnError: true)
        //new SkillCategory(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //skillCategory.id
    }

    void "test get"() {
        setupData()

        expect:
        skillCategoryService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<SkillCategory> skillCategoryList = skillCategoryService.list(max: 2, offset: 2)

        then:
        skillCategoryList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        skillCategoryService.count() == 5
    }

    void "test delete"() {
        Long skillCategoryId = setupData()

        expect:
        skillCategoryService.count() == 5

        when:
        skillCategoryService.delete(skillCategoryId)
        sessionFactory.currentSession.flush()

        then:
        skillCategoryService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        SkillCategory skillCategory = new SkillCategory()
        skillCategoryService.save(skillCategory)

        then:
        skillCategory.id != null
    }
}
