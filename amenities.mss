#amenities[amenity="cafe"][zoom >= 15] {
  point-file:url('maki/renders/cafe-18.png');
  point-allow-overlap:true;point-ignore-placement:true;
}
/*
#amenities[zoom >= 15]::a {
// experiment - show all random amenities
    //point-ignore-placement:true;
    //point-
    [tourism="viewpoint"] {
    text-face-name:'Roboto Condensed Light';
    text-size:9;
    text-name:'[name]';
    
    text-allow-overlap:true;
    text-fill: gray; //hsl(220,90%,50%);
    text-wrap-width:50;
    }
}
*/
#amenities[zoom >= 15]::a {
  [amenity="toilets"],
  [shop="bicycle"],
  [amenity="restaurant"],
  [amenity="fast_food"],
  [shop="supermarket"],
  [shop="convenience"],
  [shop="general"],
  [shop="bakery"] ,
  [tourism="viewpoint"]
    {
    point-allow-overlap:true;
    point-ignore-placement:true;
  }
  [amenity="toilets"] {    
    //point-file:url('maki/renders/toilets-18.png'); 
    point-file:url('http://www.sjjb.co.uk/mapicons/png/amenity_toilets.p.12.png')
  }
  [shop="bicycle"] {      point-file:url('http://www.sjjb.co.uk/mapicons/png/shopping_bicycle.p.20.png'); }
  [amenity="restaurant"] {point-file:url('maki/renders/restaurant-18.png'); }
  [amenity="fast_food"] { point-file:url('maki/renders/fast-food-18.png'); }
  [shop="supermarket"] {  point-file:url('maki/renders/grocery-18.png'); }
  [shop="convenience"],
  [shop="general"] {      point-file:url("http://www.sjjb.co.uk/mapicons/png/shopping_convenience.p.16.png"); }
  [shop="bakery"]  {      point-file:url('icons/shopping_bakery.p.16.png'); }
  [tourism="viewpoint"] { point-file:url('http://www.sjjb.co.uk/mapicons/png/tourist_view_point.p.12.png'); }
}

#amenities[zoom >= 12]::a {
  [tourism="caravan_site"],
  [tourism="camp_site"]{
    point-allow-overlap:true;point-ignore-placement:true;
  }
  [tourism="caravan_site"] { point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.20.png'); }
  [tourism="camp_site"] {   point-file:url('maki/renders/campsite-12.png'); }

}
#amenities[zoom >= 13][city_distance>6000.0],/*[inner_city=0]::a,*/
#amenities[zoom >= 16]{
  [tourism="basic_hut"],
  [tourism="hotel"],
  [tourism="caravan_site"],
  [tourism="camp_site"],
  [tourism="winery"],
  [amenity="winery"],
  [amenity="pub"],
  [amenity="bar"],
  [tourism="picnic_site"]
    {
    // this seemed to make an extra blob
//    [city_distance > 6000] { point-allow-overlap:true; }
//    point-ignore-placement:true;

    [zoom >= 15] {
      text-face-name:'Roboto Condensed Light';
      text-size:10;
      text-name:'[name]';
      text-dx:8;
      [city_distance > 6000] { text-allow-overlap:true; }
      text-fill: hsl(220,90%,50%);
      text-wrap-width:50;
      [brewery="yes"] {
        text-halo-fill:white;
        text-halo-radius:1.5;
        text-fill:hsla(40,60%,20%,90%);
        text-size:11;
        text-face-name:'Roboto Condensed Bold';
        text-horizontal-alignment:middle;
      }

    }
  }
  [tourism="hotel"]       { point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_hotel2.p.20.png'); }
  [tourism="basic_hut"],
  [tourism="alpine_hut"],
  [tourism="wilderness_hut"]   { 
    point-allow-overlap:true;
    point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png'); 
  }
  [building="hut"]   { point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png'); }
  [tourism="winery"],
  [amenity="winery"]      { point-file:url('http://www.millerwinery.com/sites/default/files/content-images/grape.png'); }
  [tourism="picnic_site"] { 
    point-file:url('http://www.sjjb.co.uk/mapicons/png/tourist_picnic.p.16.png'); 
    point-allow-overlap:false; // does nothing?
    
  }
  [amenity="pub"],[amenity="bar"] {
    point-file:url('maki/renders/beer-18.png');
    point-allow-overlap:true;
    [brewery="yes"] {
//    point-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.p.24.png');
    point-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.glow.32.png');
      point-ignore-placement:false;
  }
}

  
}
/*
#amenities[zoom >= 14]::a {
    point-file:url('maki/renders/beer-18.png');
  [brewery="yes"] {
//    point-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.p.24.png');
    point-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.glow.24.png');
  }
}
*/

/*
#amenities[amenity="pub"][zoom >= 14]::a,
#amenities[amenity="bar"][zoom >= 14]::a{
  point-allow-overlap:true;point-ignore-placement:true;
}
*/

/*
#amenities[tourism="basic_hut"][zoom >= 13]::a { 
    point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png');  
}
*/
/*
#amenities[tourism="basic_hut"][zoom >= 13],
#amenities[tourism="hotel"][zoom >= 13]{
  [tourism="basic_hut"] { 
//    point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png'); 
  point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.20.png');

  }
  [tourism="hotel"] { 
    point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_hotel2.p.20.png'); 
  }
  point-ignore-placement:true;
  point-allow-overlap:true;
} 
*/

#barriers[zoom>=14][barrier="gate"] {
  point-file:url('http://www.sjjb.co.uk/mapicons/png/barrier_gate.p.12.png');
  point-ignore-placement:true;
  point-opacity:0.7;
}

#naturals[zoom >=12],
#randompois[zoom >=13] {
      text-face-name:'Roboto Condensed Italic';
      text-size:10;
      text-name:'[name]';
      text-fill: hsl(220,00%,50%);
      text-wrap-width:50;
      text-dx:10;
      text-placement-type:simple;
      text-placements:E,NE,SE,N,S,W,10,9,8;
    }
