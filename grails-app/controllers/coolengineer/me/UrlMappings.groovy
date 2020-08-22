package coolengineer.me

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }
        "/grails"(view: "/grails_index")
        "/grails_index"(view: "/grails_index")
//        "/"(view: "/index")
        "/"(controller: 'homepage', action: 'index')
        "/index"(controller: 'homepage', action: 'index')
        "/privacypolicy"(view: '/privacypolicy')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
