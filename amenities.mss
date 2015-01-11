
// amenities useful in towns
[zoom >= 12] {
  
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
  
  //[amenity="shelter"]   { marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_shelter2.p.16.png'); }
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

// Camping accomodation
#amenities[zoom >= 12][tourism="caravan_site"] {
    marker-allow-overlap:true;marker-ignore-placement:true;
    marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.20.png'); 
    [zoom <= 13] { marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_caravan_park.p.12.png'); }
  }
  
#amenities[zoom >= 12][tourism="basic_hut"],
#amenities[zoom >= 12][tourism="alpine_hut"], 
#amenities[zoom >= 12][tourism="wilderness_hut"],
#amenities[zoom >= 12][building="hut"] { 
    marker-allow-overlap:true;marker-ignore-placement:true;
    marker-file:url('http://www.sjjb.co.uk/mapicons/png/accommodation_alpinehut.p.16.png'); 
    [zoom <= 13] {
      marker-width:12;
    }
}
  
#amenities[zoom >= 14][amenity="shelter"] {
    marker-allow-overlap:true;marker-ignore-placement:true;
    marker-width: 16;
    marker-file:url('picnic-shelter-w2.svg'); 

}  
#amenities[zoom >= 12][tourism="camp_site"] {   
    marker-allow-overlap:true;marker-ignore-placement:true;
    [zoom >= 16] { marker-file:url('maki/campsite-24.png'); }
    [zoom >= 14][zoom <= 15] { marker-file:url('maki/campsite-18.png'); }
    [zoom <= 13] { marker-file:url('maki/campsite-12.png');  }
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
      text-name:[name];
      text-size:10; 
      [zoom >= 16] { text-name:[name]; text-face-name:'Roboto Condensed Light'; text-size: 12; }
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
#randompois[zoom >=13][power != "station"][historic != "monument"],
#randompois[zoom >= 14][historic = "monument"] {
    #naturals {
    marker-type:ellipse;
    marker-fill:hsla(180, 0.3, 0.5, 0.5);
    marker-width:2;
    marker-allow-overlap:true;
    }
    
    text-face-name:'Roboto Condensed Italic';
    text-size:10;
    text-name:'[name]';
    text-fill: hsl(220,00%,50%);
    text-wrap-width:50;
    text-dx:8;
    text-placement-type:simple;
    text-placements:E,NE,SE,N,S,W,10,9,8;
    [zoom >= 14] { text-size: 12; text-fill: hsl(220,00%,40%);}
    [zoom >= 15] { text-size: 13; text-fill: hsl(220,00%,30%);}
    #naturals [waterway='waterfall'] { text-fill: hsla(220, 50%, 50%, 0.7); }
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

}



///////////////// Polygons


#water { 
  [zoom >= 9] {
    line-color:darken(@water,10%);
    line-smooth:1.0;
    [zoom <= 10] { line-width:0.5; } 
  }
  polygon-smooth:1.0;
  polygon-fill:@water; 
}

#water[zoom >=15][size > 100000],
#water[zoom >=14][size > 1000000],
#water[zoom >=12][size > 5000000],
#water[zoom >=10][size > 30000000]{
    ::label { 
      text-face-name:'CartoGothic Std Italic';
      text-name:'[name]';
      text-size:11;
      text-wrap-width:20;
      text-wrap-before:true;
      text-halo-fill:@water;
      text-halo-radius:1.5;
  
      [zoom<=11] { text-size: 10; }
      text-fill:hsla(220,80%,20%,50%);
      text-placement-type:simple;
      text-placement:interior;
    }
}

@green:hsla(100,50%,40%,10%);
#green {
  // try to distinuish small parks from big NP boundaries...
  //[is_park=1]
  [size < 10000000] 
    {
    polygon-fill:@green;
    polygon-smooth:0.5;
  
  }
  [zoom >=9][is_park=1] { 
    line-width:0.5;
    line-color:hsl(100,70%,30%);
    line-smooth:0.5;
  }
  [zoom >= 8][is_park=0] { 
    line-width:0;
    // ##questionable! dots for national parks?
//    polygon-pattern-file:url(https://dl.dropboxusercontent.com/u/767553/greendot3.png);
 //   polygon-pattern-opacity:0.1;
    
    //polygon-pattern
    //    polygon-smooth:0.2;
    //polygon-fill:hsla(100,50%,40%,15%);
  }
  [leisure ='pitch'] { line-width: 0; } // gets applied to too much?
  [zoom >= 13][is_park=0]
   { 
    line-width:2;
    line-color:hsla(100,70%,40%,0.4);
    line-smooth:0.2;
    line-dasharray:4,6;
    // draw a text label around the perimeter of state parks etc.
    text-name:[name];
    text-placement:line;
    text-dy:-4;
    text-face-name:'CartoGothic Std Book';
    text-size:10;
    text-fill:hsla(100,60%,30%, 0.8);
    //line-offset:4;//##
    //image-filters:agg-stack-blur(1,1);
  }
}

#green[zoom >=15][is_park=1][size > 10000][size < 100000]::parklabel {
    text-face-name:'CartoGothic Std Italic';
    text-name:'[name]';
    text-size:11;
    text-wrap-width:50;
    text-fill:hsla(100,20%,20%,60%);
    text-placement-type:simple;
    text-halo-radius:3;
    text-halo-fill:@green;//hsla(100,20%,80%,70%); //@green
}

//#greenlabels[zoom >=16][size > 50000],
#greenlabels[zoom >=15][size > 100000],
#greenlabels[zoom >=14][size > 1000000],
#greenlabels[zoom >=12][size > 5000000],
#greenlabels[zoom >=10][size > 30000000]{
    text-face-name:'CartoGothic Std Italic';
    text-name:'[name]';
    text-size:11;
    text-wrap-width:50;
    [zoom<=11] { text-size: 10; }
    text-fill:hsla(100,80%,20%,60%);
    text-placement-type:simple;
    text-halo-radius:3;
    text-halo-fill:hsla(100,20%,80%,70%); //@green
    
}

#education[zoom >=12] {
  polygon-fill:hsla(60,60%,85%,50%);
}

#buildings[zoom >=15] {
  polygon-fill:hsla(0,0%,20%,10%);
  polygon-smooth:0.2;
}

#landuse[leisure='golf_course'][zoom >=12] {
  polygon-fill:hsla(100,10%,70%,30%);
}



#landuse[landuse='industrial'][zoom >=12],
#landuse[landuse='quarry'][zoom >=12],
#landuse[power='generator'][zoom >=12]
{
  polygon-fill:hsla(320,40%,80%,30%);
}

#landuse[zoom >= 15] {
    text-face-name:'CartoGothic Std Italic';
    text-name:'[name]';
    text-size:11;
    text-wrap-width:50;
    [zoom<=11] { text-size: 10; }
    text-fill:hsla(100,20%,20%,20%);
    text-placement-type:simple;
    //text-halo-radius:3;
    //text-halo-fill:@green;//hsla(100,20%,80%,70%); //@green
}


#landuse[power='generator'][zoom >=13]::labels{
    text-face-name:'CartoGothic Std Book';
    text-name:'[name]';
    text-size:11;
    text-wrap-width:50;
    text-wrap-before:true;
  
    text-fill:hsla(0,0%,0%,70%);
    text-placement-type:simple;
    text-placement:interior;
}


#landuse[aeroway='aerodrome'][zoom >=12] {
  polygon-fill:hsla(320,20%,80%,30%);
  line-color:hsla(320,20%,50%,80%);
  [zoom>=13] { 
    text-face-name:'CartoGothic Std Book';
    text-name:'[name]';
    text-size:11;
    text-wrap-width:50;
  
    text-fill:hsla(0,0%,0%,70%);
    text-placement-type:simple;
    text-placement:interior;
  }
}


#beach[zoom >= 11] { polygon-fill:hsla(45,70%,70%,0.3); }

#stateboundaries {
  line-width: 1;
  line-color: #959;
  //[zoom >= 9] { line-dasharray:4,8; }
  [zoom >= 13] { image-filters:agg-stack-blur(2,2); }
}

// meh, find a better icon
#fords[zoom >= 15] {
    point-file:url('http://twitgrow.com/wp-content/plugins/WP_Super_Store/images/newsletter/newsletter-warning-icon.png');
  point-allow-overlap:true;
  point-transform:scale(0.6,0.6);
}

#military[zoom >= 9] {
  polygon-fill:hsla(0,0%,0%,10%);
  line-width:1;
  line-color:hsla(0,0%,50%,50%);
  [zoom>=12] { 
    text-face-name:'CartoGothic Std Book';
    text-name:'[name]';
    text-size:11;
    text-wrap-width:50;
  
    text-fill:hsla(0,0%,0%,70%);
    text-placement-type:simple;
    text-placement:interior;
  }
}
// dam walls
#dam[zoom >= 11] {
  polygon-fill:hsla(0,0%,50%,70%);
}
