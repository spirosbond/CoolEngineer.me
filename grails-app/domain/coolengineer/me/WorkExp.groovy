package coolengineer.me

import grails.databinding.BindingFormat
import groovy.transform.ToString

@ToString(includes = 'title', includeNames = true, includePackage = false)
class WorkExp {

    Date dateCreated
    Date lastUpdated

    String title
    String description
    String employerName
    String location

    @BindingFormat('yyyy-MM-dd')
    Date startDate
    boolean current = false

    @BindingFormat('yyyy-MM-dd')
    Date endDate

    static belongsTo = [appUser: AppUser]

    static constraints = {

        title nullable: false, blank: false
        location nullable: false, blank: false
        description nullable: false, blank: false
        employerName nullable: false, blank: false
        startDate nullable: false, blank: false
        endDate nullable: true, blank: true

    }
}
