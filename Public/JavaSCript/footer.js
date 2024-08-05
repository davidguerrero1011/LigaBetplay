$(document).ready(function() {

    let socialNetworkIcons = ['logo-facebook', 'logo-twitter', 'logo-instagram', 'logo-youtube'];
    let hrefSocialNetworks = [
                                'https://www.facebook.com/DimayorOficial/',
                                'https://www.instagram.com/dimayoroficial/',
                                'https://x.com/dimayor?lang=es',
                                'https://www.youtube.com/channel/UCPFlvAUg0nImOvaYGTuyxLw'
                             ]; 
    let buildElements = '';
    for (let i = 0; i < socialNetworkIcons.length; i++) {
        buildElements += `<li class="list-inline-item"> 
                            <a href="${hrefSocialNetworks[i]}" target="_blank"> 
                                <ion-icon name="${socialNetworkIcons[i]}"></ion-icon> 
                            </a> 
                          </li> 
                        `;
    }
    $('#socialNetworkAppend').append(buildElements);

});