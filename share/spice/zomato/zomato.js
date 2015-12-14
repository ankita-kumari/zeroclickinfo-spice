(function (env) {
    "use strict";
    env.ddg_spice_zomato = function(api_result){

        // Validate the response (customize for your Spice)
        if (!api_result || api_result.error) {
            return Spice.failed('zomato');
        }

        // Render the response
        Spice.add({
            id: "zomato",

            // Customize these properties
            name: "Restaraunts results",
            data: api_result,
            meta: {
                sourceName: "zomato.com",
                sourceUrl: 'http://example.com/url/to/details/' + api_result.name
            },
            normalize: function(item) {
                return {
                    // customize as needed for your chosen template
                    title: api_result.title,
                    subtitle: api_result.subtitle,
                    image: api_result.icon
                };
            },
            templates: {
                group: 'info'
            }
        });
    };
}(this));
