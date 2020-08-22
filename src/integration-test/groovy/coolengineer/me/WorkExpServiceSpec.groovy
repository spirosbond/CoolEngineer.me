package coolengineer.me

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class WorkExpServiceSpec extends Specification {

    WorkExpService workExpService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new WorkExp(...).save(flush: true, failOnError: true)
        //new WorkExp(...).save(flush: true, failOnError: true)
        //WorkExp workExp = new WorkExp(...).save(flush: true, failOnError: true)
        //new WorkExp(...).save(flush: true, failOnError: true)
        //new WorkExp(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //workExp.id
    }

    void "test get"() {
        setupData()

        expect:
        workExpService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<WorkExp> workExpList = workExpService.list(max: 2, offset: 2)

        then:
        workExpList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        workExpService.count() == 5
    }

    void "test delete"() {
        Long workExpId = setupData()

        expect:
        workExpService.count() == 5

        when:
        workExpService.delete(workExpId)
        sessionFactory.currentSession.flush()

        then:
        workExpService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        WorkExp workExp = new WorkExp()
        workExpService.save(workExp)

        then:
        workExp.id != null
    }
}
