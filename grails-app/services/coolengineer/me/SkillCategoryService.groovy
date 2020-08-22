package coolengineer.me

import grails.gorm.services.Service

@Service(SkillCategory)
interface SkillCategoryService {

    SkillCategory get(Serializable id)

    List<SkillCategory> list(Map args)

    Long count()

    void delete(Serializable id)

    SkillCategory save(SkillCategory skillCategory)

}