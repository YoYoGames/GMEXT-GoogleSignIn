

var _headers = ds_map_create();
ds_map_add(_headers, "Content-Type", "application/json");

var _body = json_stringify({ state: state });

search_request = http_request(search_url, "POST", _headers, _body);
ds_map_destroy(_headers);