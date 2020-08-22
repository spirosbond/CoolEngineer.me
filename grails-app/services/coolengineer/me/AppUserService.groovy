package coolengineer.me

import grails.gorm.services.Service

@Service(AppUser)
interface AppUserService {

    AppUser get(Serializable id)

    List<AppUser> list(Map args)

    Long count()

    void delete(Serializable id)

    AppUser save(AppUser appUser)

    AppUser update(Serializable id, Long version, byte[] featuredImageBytes, String featuredImageContentType)


}