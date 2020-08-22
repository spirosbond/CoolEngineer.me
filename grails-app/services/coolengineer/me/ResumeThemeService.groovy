package coolengineer.me

import grails.gorm.services.Service

@Service(ResumeTheme)
interface ResumeThemeService {

    ResumeTheme get(Serializable id)

    List<ResumeTheme> list(Map args)

    Long count()

    void delete(Serializable id)

    ResumeTheme save(ResumeTheme resumeTheme)

}