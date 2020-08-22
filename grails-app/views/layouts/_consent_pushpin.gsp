%{--
<!-- Modal Structure -->
<div id="session-modal" class="modal bottom-sheet">
    <div class="modal-content">
        <h4>Modal Header</h4>
        <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
        <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
</div>

<g:javascript>
    document.addEventListener('DOMContentLoaded', function() {
        // var sessionModal = document.getElementById('session-modal');
        // var instance = M.Modal.init(sessionModal);
        // instance.open();
        M.Modal.getInstance(document.getElementById('session-modal')).open();
    });
</g:javascript>
--}%


%{--<div class="consent-pushpin">
    <div class="card blue-grey darken-2">
        <div class="card-content white-text">
            <span class="card-title">Protecting your privacy</span>
            <p>We use cookies to provide and improve our services. By using our site, you consent to delicious cookies &#x1F36A;</p>
        </div>

        <div class="card-action row">
            <a class="white-text left" href="/privacypolicy" target="_blank">Learn more</a>
            <a class="white-text right" href="#!" onclick="hide(document.querySelector('.consent-pushpin'))">OK</a>
        </div>
    </div>
    <a href="#!" class="pushpin-close" onclick="hide(document.querySelector('.consent-pushpin'))"><i class="material-icons">close</i></a>
</div>

<g:javascript>

    var consentPushpin = document.querySelector('.consent-pushpin');
    var close = document.querySelector('.pushpin-close');

</g:javascript>--}%

<g:javascript>
    window.cookieconsent.initialise({
        palette: {
            popup: {
                background: "#455a64",
                text: "#ffffff"
            },
            button: {
                background: "#ffffff",
                text: "#000000"
            }
        },
        theme: "block",
        position: "bottom-right",
        content: {
            message: "We use cookies to provide and improve our services. By using our site, you consent to delicious cookies &#x1F36A;<br\>",
            href: "/privacypolicy",
            dismiss: 'Got it'
        },
        cookie: {
            expiryDays: 7,
            domain: "${grailsApplication?.config?.myserver?.url}"
        }
    });
</g:javascript>