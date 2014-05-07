// amenities useful in towns
#amenities[zoom >= 15]::a {
  [shop=~"bicycle|supermarket|convenience|general|bakery"],
  [amenity=~"cafe|toilets|restaurant|fast_food|shelter"],
  [tourism="viewpoint"]
    {
    point-allow-overlap:true;
    point-ignore-placement:true;
    [city_distance < 6000] { 
      point-allow-overlap:false;
      point-ignore-placement:false;
    }
  }
  
  [amenity="toilets"]   { point-file:url('http://www.sjjb.co.uk/mapicons/png/amenity_toilets.p.12.png');  }
  [amenity="cafe"]      { point-file:url('maki/cafe-18.png');  }
  [shop="bicycle"]      { point-file:url('http://www.sjjb.co.uk/mapicons/png/shopping_bicycle.p.20.png'); }
  [amenity="restaurant"]{ point-file:url('maki/restaurant-18.png'); }
  [amenity="fast_food"] { point-file:url('maki/fast-food-18.png'); }
  [shop="supermarket"]  { point-file:url('maki/grocery-18.png'); }
  [shop="convenience"],
  [shop="general"]      { point-file:url("http://www.sjjb.co.uk/mapicons/png/shopping_convenience.p.16.png"); }
  [shop="bakery"]       { point-file:url('http://www.sjjb.co.uk/mapicons/png/shopping_bakery.p.16.png'); }
  [tourism="viewpoint"] { point-file:url('http://www.sjjb.co.uk/mapicons/png/tourist_view_point.p.12.png'); }
  [amenity="shelter"]   { point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_shelter2.p.16.png'); }
}

/* Camping accomodation */
#amenities[zoom >= 12]::a {
  [tourism="caravan_site"] {
    point-allow-overlap:true;point-ignore-placement:true;
    point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.20.png'); 
    [zoom <= 13] { point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.12.png'); }
  }
  
  [tourism=~"basic_hut|alpine_hut|wilderness_hut"],
  [building="hut"]{ 
    point-allow-overlap:true;point-ignore-placement:true;
    point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png'); 
    [zoom <= 13] {
      point-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.12.png'); 
    }
  }
  [tourism="camp_site"] {   
    point-allow-overlap:true;point-ignore-placement:true;
    point-file:url('maki/campsite-18.png'); 
    [zoom <= 13] {
      point-file:url('maki/campsite-12.png'); 
    }
  }
}

//Labels
#amenities[zoom >= 13][city_distance>6000.0],
#amenities[zoom >= 13][brewery="yes"],
#amenities[zoom >= 16]{
[tourism=~"hotel|guest_house|basic_hut|alpine_hut|wilderness_hut|caravan_site|camp_site|winery|viewpoint|picnic_site"],
[amenity=~"winery|pub|bar"][brewery != "yes"],
  [building="hut"]
  {
    // Little blue captions
    [zoom >= 15],
    [tourism="wilderness_hut"],
    [tourism="alpine_hut"],[building="hut"] {
      text-face-name:'Roboto Condensed Light';
      text-size:10;
      text-name:'[name]';
      text-dx:8;
      [city_distance > 6000] { text-allow-overlap:true; }
      text-fill: hsl(220,90%,50%);
      text-wrap-width:50;

    }
  }
  [tourism="winery"],
  [amenity="winery"]      { point-file:url('http://www.millerwinery.com/sites/default/files/content-images/grape.png'); }
  [tourism="picnic_site"] { 
    point-file:url('http://www.sjjb.co.uk/mapicons/png/tourist_picnic.p.16.png'); 
    point-allow-overlap:false; // does nothing?
    
  }
  [amenity=~"pub|bar"],[brewery="yes"] {
    point-file:url('maki/beer-18.png');
    point-allow-overlap:true;
    [city_distance < 6000] { 
      point-file:url('maki/beer-12.png');
      point-allow-overlap:false;
    }
    [brewery="yes"][zoom >= 14] {
//    point-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.p.24.png');
      point-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.glow.32.png');
      point-ignore-placement:false;
      point-allow-overlap:true;
      text-name:'[name]';
      text-halo-fill:white;
      text-wrap-width:50;
      text-halo-radius:1.5;
      text-fill:hsla(40,60%,20%,90%);
      text-size:11;
      text-face-name:'Roboto Condensed Bold';
      text-horizontal-alignment:middle;
      text-dy:4;
      text-line-spacing:-4;
      text-allow-overlap:true;
      
    }
  }
}

#barriers[zoom>=14][barrier="gate"] {
  point-file:url('http://www.sjjb.co.uk/mapicons/png/barrier_gate.p.12.png');
  point-ignore-placement:true;
  point-opacity:0.7;
}

// Geographic features like mountain peaks, plus towers etc.
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



#landmarks[aeroway='helipad'][zoom >= 13] {
  //marker-width:;
  marker-file:url('http://www.sjjb.co.uk/mapicons/png/transport_helicopter_pad.p.16.png');
}
