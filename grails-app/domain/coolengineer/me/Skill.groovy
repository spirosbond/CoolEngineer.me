package coolengineer.me

import groovy.transform.ToString

@ToString(includes = 'skillName', includeNames = true, includePackage = false)
class Skill {

    Date dateCreated
    Date lastUpdated

    String skillName
    Integer level

    static belongsTo = [skillCategory: SkillCategory]

    static constraints = {
        skillName nullable: false, blank: false
        level nullable: false, blank: false, range: 0..5
    }
}
