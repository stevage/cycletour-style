// amenities useful in towns
#amenities[zoom >= 15]::a,
#amenities[zoom >=14][tourism="viewpoint"]::a,
#amenities[zoom >=14][tourism="attraction"]::a,
{
  [shop=~"bicycle|supermarket|convenience|general|bakery"],
  [amenity=~"cafe|toilets|restaurant|fast_food|drinking_water"],
  [tourism=~"viewpoint|attraction"]
    {
    marker-allow-overlap:true;
    marker-ignore-placement:true;
    [city_distance < 6000] { 
      
      marker-allow-overlap:false;
      marker-ignore-placement:false;
    }
  }
  
  /*[amenity="shelter"]   { marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_shelter2.p.16.png'); }*/
  [amenity="toilets"]   { marker-file:url('http://www.sjjb.co.uk/mapicons/png/amenity_toilets.p.12.png');  }
  [amenity="cafe"]      { marker-file:url('maki/cafe-18.png');  }
  [shop="bicycle"]      { marker-file:url('http://www.sjjb.co.uk/mapicons/png/shopping_bicycle.p.20.png'); }
  [amenity="restaurant"]{ marker-file:url('maki/restaurant-18.png'); }
  [amenity="fast_food"] { marker-file:url('maki/fast-food-18.png'); }
  [shop="supermarket"]  { marker-file:url('maki/grocery-18.png'); }
  [shop="convenience"],
  [shop="general"]      { marker-file:url("http://www.sjjb.co.uk/mapicons/png/shopping_convenience.p.16.png"); }
  [shop="bakery"]       { marker-file:url('http://www.sjjb.co.uk/mapicons/png/shopping_bakery.p.16.png'); }
  [tourism="viewpoint"] { marker-file:url('http://www.sjjb.co.uk/mapicons/png/tourist_view_point.p.12.png'); }
  [tourism="attraction"] { 
    marker-file:url('maki/star-18.png'); 
    [zoom <= 14] { marker-file:url('maki/star-12.png'); }
  }
  //Freepik/Flaticon/CC-BY 3.0
  [amenity="drinking_water"] {marker-width:16;marker-file:url('water19.png'); } 
  //[amenity="drinking_water"] { marker-file:url('maki/grocery-18.png'); } 
}

/* Camping accomodation */
#amenities[zoom >= 12] {
  [tourism="caravan_site"] {
    marker-allow-overlap:true;marker-ignore-placement:true;
    marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.20.png'); 
    [zoom <= 13] { marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.12.png'); }
  }
  
  [tourism="basic_hut"], [tourism="alpine_hut"], [tourism="wilderness_hut"],[amenity="shelter"],
  [building="hut"]{ 
    marker-allow-overlap:true;marker-ignore-placement:true;
    marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png'); 
    [zoom <= 13] {
      marker-width:12;
    }
  }
  [tourism="camp_site"] {   
    marker-allow-overlap:true;marker-ignore-placement:true;
    marker-file:url('maki/campsite-18.png'); 
    [zoom <= 13] {
      marker-file:url('maki/campsite-12.png'); 
    }
  }
}

//Labels
#amenities[zoom >= 13][city_distance>6000.0],
#amenities[zoom >= 12][brewery="yes"],
#amenities[zoom >= 16]{
[tourism=~"hotel|guest_house|basic_hut|alpine_hut|wilderness_hut|caravan_site|camp_site|winery|viewpoint|picnic_site|attraction"],
[amenity="winery"][brewery != "yes"],
[amenity="pub"][brewery != "yes"],
[amenity="bar"][brewery != "yes"],
[shop="winery"], [building="hut"]
  {
    // Little blue captions
    [zoom >= 15],
    [tourism="wilderness_hut"],
    [tourism="alpine_hut"],[building="hut"] {
      text-face-name:'Roboto Condensed Light';
      text-size:10;
      text-name:'[name]';
      text-dx:10;
      [city_distance > 6000] { text-allow-overlap:true; }
      text-fill: hsl(220,90%,50%);
      text-wrap-width:50;

    }
  }
  [tourism="winery"],[shop="winery"],[shop="wine"],
  [amenity="winery"]      { 
    marker-file:url('http://www.millerwinery.com/sites/default/files/content-images/grape.png'); 
    marker-allow-overlap:true;
    marker-opacity:0.8;
  }
  [tourism="picnic_site"] { 
    marker-file:url('http://www.sjjb.co.uk/mapicons/png/tourist_picnic.p.16.png'); 
    marker-allow-overlap:true; 
  }
  [amenity="pub"], [amenity="bar"],[brewery="yes"] {
    marker-file:url('maki/beer-18.png');
    [zoom >= 15] {
      marker-file:url('maki/beer-24.png');
    }
    marker-allow-overlap:true;
    [city_distance < 6000] { 
      marker-file:url('maki/beer-12.png');
      marker-allow-overlap:false;
    }
    [brewery="yes"][zoom >= 12] {
//    marker-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.p.24.png');
      marker-file:url('http://www.sjjb.co.uk/mapicons/png/food_biergarten.glow.32.png');
      marker-ignore-placement:false;
      marker-allow-overlap:true;
      [zoom >= 14] { 
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
}

#barriers[zoom>=14][barrier="gate"] {
  marker-file:url('http://www.sjjb.co.uk/mapicons/png/barrier_gate.p.12.png');
  marker-ignore-placement:true;
  marker-opacity:0.7;
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
      [zoom >= 14] { text-size: 12; text-fill: hsl(220,00%,40%);}
      [zoom >= 15] { text-size: 13; text-fill: hsl(220,00%,30%);}
    }

// <div>Icon made by <a href="http://yanlu.de" title="Yannick">Yannick</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed under <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0">CC BY 3.0</a></div>
#randompois[zoom >= 13][power_source="wind"] {
  marker-file:url('wind-turbine.png');
  marker-width:12;
  [zoom = 13] { marker-width: 8; marker-opacity:0.5;}
  [zoom = 14] { marker-width: 12; marker-opacity:0.8;}
  [zoom = 15] { marker-width: 16; marker-opacity:0.8;}
  [zoom >= 16] { marker-width: 24; marker-opacity:0.8;}
  marker-allow-overlap:true;
//  polygon-fill: gray;
//  [zoom = 14] { polygon-opacity: 0.3; }
//  polygon-opacity:0.5;
}



#landmarks[aeroway='helipad'][zoom >= 13] {
  //marker-width:;
  marker-file:url('http://www.sjjb.co.uk/mapicons/png/transport_helicopter_pad.p.16.png');
}
