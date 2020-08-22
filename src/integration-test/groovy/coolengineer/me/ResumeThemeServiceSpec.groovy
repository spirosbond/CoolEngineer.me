package coolengineer.me

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ResumeThemeServiceSpec extends Specification {

    ResumeThemeService resumeThemeService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ResumeTheme(...).save(flush: true, failOnError: true)
        //new ResumeTheme(...).save(flush: true, failOnError: true)
        //ResumeTheme resumeTheme = new ResumeTheme(...).save(flush: true, failOnError: true)
        //new ResumeTheme(...).save(flush: true, failOnError: true)
        //new ResumeTheme(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //resumeTheme.id
    }

    void "test get"() {
        setupData()

        expect:
        resumeThemeService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ResumeTheme> resumeThemeList = resumeThemeService.list(max: 2, offset: 2)

        then:
        resumeThemeList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        resumeThemeService.count() == 5
    }

    void "test delete"() {
        Long resumeThemeId = setupData()

        expect:
        resumeThemeService.count() == 5

        when:
        resumeThemeService.delete(resumeThemeId)
        sessionFactory.currentSession.flush()

        then:
        resumeThemeService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ResumeTheme resumeTheme = new ResumeTheme()
        resumeThemeService.save(resumeTheme)

        then:
        resumeTheme.id != null
    }
}
