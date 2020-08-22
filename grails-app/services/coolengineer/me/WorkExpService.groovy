package coolengineer.me

import grails.gorm.services.Service

@Service(WorkExp)
interface WorkExpService {

    WorkExp get(Serializable id)

    List<WorkExp> list(Map args)

    Long count()

    void delete(Serializable id)

    WorkExp save(WorkExp workExp)

}