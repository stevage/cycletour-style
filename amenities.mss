#amenities[amenity="cafe"][zoom >= 15] {
  point-file:url('maki/renders/cafe-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}
#amenities[amenity="pub"][zoom >= 14] {
  point-file:url('maki/renders/beer-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}

#amenities[amenity="restaurant"][zoom >= 15] {
  point-file:url('maki/renders/restaurant-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}

#amenities[amenity="fast_food"][zoom >= 15] {
  point-file:url('maki/renders/fast-food-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}

#amenities[shop="supermarket"][zoom >= 15] {
  point-file:url('maki/renders/grocery-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}
#amenities[shop="convenience"][zoom >= 15] {
  point-file:url('maki/renders/grocery-12.png');
  point-allow-overlap:true;point-ignore-placement:true;
}
#amenities[shop="bakery"][zoom >= 15] {
//  marker-file:url('http://www.sjjb.co.uk/mapicons/svg/shopping/bakery.svg');
  marker-file:url('icons/shopping_bakery.p.16.png');
  marker-allow-overlap:true;marker-ignore-placement:true;
//  marker-width:18; marker-height:16;

}

/* 
#nodes[amenity="parking"],#amenities[amenity="parking"] {
point-file:url('maki/renders/parking-18.png');
point-allow-overlap:true;
}
*/
#amenities[amenity="toilet"][zoom >= 15] {
  point-file:url('maki/renders/toilets-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}

[zoom >= 12] {  
  #amenities[tourism="caravan_site"],
    #amenities[tourism="camp_site"],
    #amenities[tourism="caravan_site"],
    #amenities[tourism="camp_site"]
    {
    point-file:url('maki/renders/campsite-12.png');
    point-allow-overlap:true;point-ignore-placement:true;
    }
}