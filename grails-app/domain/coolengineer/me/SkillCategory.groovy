package coolengineer.me

import groovy.transform.ToString

@ToString(includes = 'skillCategoryName', includeNames = true, includePackage = false)
class SkillCategory {

    Date dateCreated
    Date lastUpdated

    String skillCategoryName
    List skillList

    static hasMany = [skillList: Skill]
    static belongsTo = [appUser: AppUser]

    static constraints = {
        skillCategoryName nullable: false, blank: false
        skillList nullable: true
        appUser nullable: false, blank: false
    }
}
