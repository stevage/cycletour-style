# Cycletour.org map style
This is a TileMill style set for the maps used on cycletour.org. It is optimised for planning cycle tours in Australia (and especially Victoria).

Some key features:

- Little distinction between road types. More major roads are progressively darker grey.
- All roads (or almost) shown at even very low zoom levels. This helps with planning long trips that avoid major highways.
- Unsealed roads are dashed. (This alone was the biggest motivation in developing this style.)
- RCN bike routes shown. A couple of special routes, such as the National Bicentennial Trail and the Australian Alps Walking Track (rideable in sections) are shown specially.
- Rail trails are given special prominence - yellow highlighting. I'm a volunteer with Rail Trails Australia.
- Towns are only shown if they have at least one food source for cyclists. This is calculated using PostGIS.
- Mountain bike routes are shown in pink.
- Relevant amenities such as bakeries, pubs, supermarkets and bike shops are prominent. Irrelevant ones like schools and churches are not.
- Terrain is included. 90m DEM for the whole of Australia and 20m for certain parts of Victoria.
- Contours are included for part of southeastern Australia.
- Train services are shown as a thick dark green line. Train lines without a passenger service are a lighter green. Tourism rail services (eg, Puffing Billy) are dashed green and yellow.

This style has been developed entirely by Steve Bennett. It is licenced CC-NC https://creativecommons.org/licenses/by-nc/3.0/au/ so you may use it for any non-commercial purpose. Get in touch though - I'd rather work with you than fork, if we can avoid it.

Interested in a commercial use? Get in touch: stevage@gmail.com.
