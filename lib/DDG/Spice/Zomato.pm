package DDG::Spice::Zomato;

# ABSTRACT: Information about restaurants, eateries and diners in India
# Start at https://duck.co/duckduckhack/spice_overview if you are new
# to instant answer development

use DDG::Spice;

# Caching - https://duck.co/duckduckhack/spice_advanced_backend#caching-api-responses
spice is_cached => 1;
spice proxy_cache_valid => "200 1d"; # defaults to this automatically

spice wrap_jsonp_callback => 0; # only enable for non-JSONP APIs (i.e. no &callback= parameter)

# API endpoint - https://duck.co/duckduckhack/spice_attributes#spice-codetocode
spice to => 'https://developers.zomato.com/api/v2.1/search?entity_id=6&entity_type=city&count=1&api_key={{ENV{DDG_ZOMATO_API_KEY}}}&jsonp={{callback}}';

# Triggers - https://duck.co/duckduckhack/spice_triggers
triggers any => 'restaurants in hyderabad';

# Handle statement
handle remainder => sub {

    # Query is in $_...if you need to do something with it before returning
    return $_;
};

1;
