package coolengineer.me

import grails.databinding.BindingFormat
import groovy.transform.ToString

@ToString(includes = 'name', includeNames = true, includePackage = false)
class Education {

    Date dateCreated
    Date lastUpdated

    String name
    String sector

    @BindingFormat('yyyy-MM-dd')
    Date startDate
    boolean current = false

    @BindingFormat('yyyy-MM-dd')
    Date endDate
//TODO: Add location?

    static belongsTo = [appUser: AppUser]

    static constraints = {
        name nullable: false, blank: false
        sector nullable: false, blank: false
        startDate nullable: false, blank: false
        endDate nullable: true, blank: true

    }
}
