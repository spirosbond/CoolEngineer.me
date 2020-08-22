package coolengineer.me

import grails.databinding.BindingFormat
import groovy.transform.ToString

@ToString(includes = ['name', 'surname'], includeNames = true, includePackage = false)
class AppUser {

    Date dateCreated
    Date lastUpdated

    String name
    String surname

    @BindingFormat('yyyy-MM-dd')
    Date dateOfBirth

    @BindingFormat('LOWERCASE')
    String email
    String phoneNumber
    String headline
    String aboutMe
    String address
    String url
    List resumeThemes
    List workExpList
    List skillCategoryList
    List educationList
    byte[] featuredImageBytes
    String featuredImageContentType

    static belongsTo = [user: User]
    static hasMany = [workExpList: WorkExp, educationList: Education, skillCategoryList: SkillCategory, resumeThemes: ResumeTheme]
//TODO: Add projects?

    static constraints = {
        name nullable: false, blank: false
        surname nullable: false, blank: false
        dateOfBirth nullable: false, blank: false
        address nullable: true, blank: true
        phoneNumber nullable: true, blank: true
        email nullable: false, blank: false, email: true
        url nullable: true, blank: true//, matches: '[a-zA-Z0-9.]*[a-zA-Z0-9]+\\.[a-z.]{2,10}+'
        headline nullable: true, blank: true, maxSize: 50
        aboutMe nullable: true, blank: true, maxSize: 150
        user nullable: false, unique: true
        featuredImageBytes nullable: true
        featuredImageContentType nullable: true
    }

    static mapping = {
        featuredImageBytes column: 'featured_image_bytes', sqlType: 'longblob'
    }
}
