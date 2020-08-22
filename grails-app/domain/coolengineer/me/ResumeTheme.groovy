package coolengineer.me

import groovy.transform.ToString

@ToString(includes = ['name','path'], includeNames = true, includePackage = false)
class ResumeTheme {

    Date dateCreated
    Date lastUpdated

    String name
    String path
    String defaultPath
    String previewImagePath
    boolean official = true
    boolean active = true

    static constraints = {
        name nullable: false, blank: false, unique: true
        path nullable: false, blank: false, unique: true
        defaultPath nullable: true, blank: true
        previewImagePath nullable: true, blank: true
    }
}
