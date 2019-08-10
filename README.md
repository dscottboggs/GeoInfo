# geoinfo
Geocoding and reverse-geocoding from the `geo-info.co` API in Crystal.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     geoinfo:
       github: dscottboggs/geoinfo
   ```

2. Run `shards install`

## Usage

```crystal
require "geoinfo"
GeoInfo::City.new(city: "New York", state: "New York", country: "US")
```

See `src/city.cr` for members available, and `spec/city_spec.cr` for more
detailed usage examples.

## Contributing

1. Fork it (<https://github.com/dscottboggs/geoinfo/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
