@water: hsl(210, 80%,82%); //#b8dee6;
//@water: hsl(210, 80%,62%); //#b8dee6;
@background:#f0fff0;

Map {
  background-color: @background;
  //buffer-size:1024;
}

#roads[zoom >= 9]
 {
/*  [highway='trunk']::carpet,
  [highway='primary']::carpet,
  [highway='secondary']::carpet,
  [highway='tertiary']::carpet*/
  ::carpet
  {
    line-width:3; line-color:hsla(0,0%,100%,50%);
    [highway='unclassified'] { 
      line-width: 1.2;
    }
    [highway='trunk'] { line-width: 3.5;}  
    line-smooth:0.45;

    // experimental way of showing bike lanes
    [cycleway='lane'][zoom >= 14],
    [cycleway='track'][zoom >= 14]{ line-color:lighten(@bikeroute,20%); }
  }
  line-width:1.2;
  [zoom <= 9] { line-width: 1.0;}
  [zoom >= 14] { line-width: 1.6; }
  line-smooth:0.4;
  [zoom >= 14] { line-smooth: 0.5; }

  line-color:gray;
  [highway='motorway'],[highway='trunk'] { line-color: black; }
  [highway='primary'] { line-color:hsl(260,20%,30%); }
  [highway='secondary'] { line-color:hsl(260,20%,45%); }

  [highway="unclassified"],[highway="road"] { 
    line-width: 0.9; 
    [zoom < 9] { line-width: 0.4; }
    [zoom >= 14] { line-width: 1.6; }
//    line-color: hsl(260,80%,60%); /* An interesting idea, highlight the quiet roads more */
    line-color: hsl(260,20%,60%); /* Purpleish */
  }
  [surface="unpaved"],[surface="dirt"],[surface="gravel"],
  [surface="unsealed"],[surface="sand"] { 
    line-dasharray: 6,1;
    [highway="unclassified"]{
      line-color:hsl(30,20%,40%);
    }
  }

  ::label[zoom >= 10]
  {
    text-face-name:'CartoGothic Std Book';
    text-size:12;
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:false;//true;
    text-spacing:150;
    text-halo-fill:hsla(0,0%,100%,60%);
    text-halo-radius:1.5;
    [zoom <= 12] { 
      text-size: 10; text-face-name: 'Roboto Condensed Light';
      text-halo-radius:1;
    }
    [highway='primary'],[highway='secondary'],[highway='tertiary'] {
        text-size: 12;
        text-max-char-angle-delta:28;
    }
//    [highway!='tertiary'] { text-allow-overlap:false; }
    [highway="unclassified"] { 
      text-halo-radius: 1; 
      text-halo-fill: hsla(0,0%,1.0,20%);
      text-size: 10;
      text-fill:hsl(0,0%,20%);
    }
  }
  [access='private'],[access='no'],[bicycle='no'] { 
    line-color: hsla(0,0%,100%,75%); // ##todo how to represent these? 
  }
}

#littleroads[zoom >= 11] {
  line-width:0.6;
  line-smooth:0.4;
  [zoom >= 14] { line-smooth: 0.5; }

  line-color:gray;
  [surface="unpaved"],[surface="dirt"],[surface="gravel"],
  [surface="unsealed"],[surface="sand"] { 
    line-dasharray: 6,1;
    line-color:hsl(30,20%,40%);
  }
  [highway='residential'] {
    [zoom <= 12] { line-width:0.3; }
    [zoom < 11] { line-width:0.2; }
  }
  ::label[zoom >= 14] {
    text-face-name:'CartoGothic Std Book';
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:false;//true;
    text-spacing:150;
    text-halo-fill:hsla(0,0%,100%,60%);
    text-halo-radius:1.5;
    text-fill:#777;
    text-size:10;
    [zoom <= 15] { 
      text-halo-radius: 1; text-halo-fill: hsla(0,0%,1.0,20%);
    }
  }
}


#roadlinks[zoom>=13] {
  line-width:0.5;
  line-color:#999;
}



#tracks[zoom >= 9]
{
/*  ::carpet {
    line-width:2; line-color:hsla(0,0%,100%,50%);
    line-smooth:0.6;
  }
*/
  line-smooth:0.6;
  line-width:0.5;
  [zoom <= 10] { line-width: 0.2; }
  [zoom >= 14] { line-width: 1; }
  
  line-color:brown;
  line-dasharray:2,0.5; 
  [zoom >= 12] { line-dasharray:3,2; }
//  [zoom >= 12][fourwd='yes'] { line-dasharray: 3,1.5,1,1.5;}
  [zoom >= 12][fourwd='yes']::ticks { 
  line-color:brown;
    line-smooth:0.6;
    line-width:2.5;
    [zoom >= 14] { line-width: 4;}
    line-dasharray: 1,79;
    line-dash-offset:1;
  }
  [zoom >= 12] {
    text-face-name:'CartoGothic Std Book';
    text-size:11;
    [zoom = 13] { text-size: 10; }
    [zoom = 12] { text-size: 7; }
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:false;//true;
    text-spacing:140;
    text-halo-fill:hsla(0,0%,100%,40%);
    text-halo-radius:1;
    text-fill:darken(brown,10%);
  }

}



#rail[zoom >= 8] {
  line-width:1;
  line-color:hsl(140,80%,40%);
  [railway="preserved"][zoom >=8]{ 
    line-width: 0.5; 
    // represent preserved lines similar to passenger services
    // assuming that they all have some kind of regular (if infrequent) service
    ::altdashes {
      line-width:2.5;
      line-color:hsl(60,90%,80%);
    }
    ::dots {
      line-width:2.5;
      line-color:hsl(140,80%,20%);
      line-dasharray:4,4;
    }
    ::label[zoom >= 14] {
      text-face-name:'CartoGothic Std Book';
      text-fill:hsl(140,70%,30%);
      text-size:11;
      [zoom >= 12] { text-size:12; }
      text-name:'[name]';
      text-placement:line;
      text-allow-overlap:true;
      text-halo-fill:hsla(0,0%,100%,60%);
      text-halo-radius:2;
    }

  }
  ::label[zoom >= 14][railway!="preserved"] {
    text-face-name:'CartoGothic Std Italic';
    text-fill:hsla(140,70%,30%,80%);

    text-size:11; 
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:true;
    text-halo-fill:hsla(0,0%,100%,40%);
    text-halo-radius:1;
  }


 }


/* Actual services */
#trains {
  ::carpet[zoom >=10] {
    line-width:5;
    line-color: hsla(0,0%,100%,40%);
  }
  line-width:2;
  [zoom <=7] { line-width: 1; }
  [zoom = 8] { line-width: 1.5; }
  line-color:hsl(140,80%,40%);
  ::dots[zoom >=10] { 
    line-width:2.5;
    line-color:hsl(140,80%,20%);
    line-dasharray:4,4;
  }
}


#stations[zoom >=10] {
  marker-width:8;
  [zoom <= 12] { marker-width: 6; }
  [zoom <= 10] { marker-width: 6; }
  [zoom <= 8] { marker-width: 4; }
  [zoom<=7] { marker-width:2; }
  marker-fill:hsla(100,70%,40%,80%);
  marker-line-color:hsla(100,70%,20%,100%);
  marker-line-width:0;
  [zoom >= 12] { marker-line-width:1;}
  marker-allow-overlap:true;
  marker-ignore-placement:true;
  ::label[zoom >= 13] {
    text-face-name: 'Roboto Condensed Light';
    
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,S,N,W,11,10,9";
  
    text-fill:hsla(100,40%,30%,100%);
    text-halo-fill:white;
    text-halo-radius:1;
    text-size:11;
    text-dx: 6;
    /* Major stations and termini */
    [name='Southern Cross'], 
    [name='Bairnsdale'],
    [name='Albury'],
    [name='Wodonga'],
    [name='Shepparton'],
    [name='Seymour'],
    [name='Wangaratta'],
    [name='Bendigo'],
    [name='Swan Hill'],
    [name='Warrnambool'],
    [name='Ballarat'],
    [name='Ararat'],
    [name='Echuca'],
    [name='Ballarat'],
    [name='Geelong']
      
      {
      text-face-name:"Roboto Condensed Bold";
      text-size: 13;
      text-allow-overlap:true;
    }
    
  }
}

/* Old rail lines, interesting to rail buffs and rail trail nerds,
but not so generally relevant I guess. */
#oldrail[zoom >= 10] {
  ::greendashes {
    line-width:0.5;
    line-color:hsl(140,40%,40%);
    line-dasharray:6,2;
 
  }
  ::label[zoom >= 13] {
    text-face-name:'CartoGothic Std Book';
    text-fill:hsl(140,40%,40%);
    text-size:10;
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:true;
    text-spacing:100;
    text-halo-fill:white;
    text-halo-radius:1;
    
  }
}

#oldstations[zoom >= 13] {
  marker-type:ellipse;
  marker-width:6;
  [zoom = 8] { marker-width: 4; }
  [zoom<=7] { marker-width:2; }
  marker-fill:hsla(100,20%,50%,40%);
  marker-line-width:1;
  marker-line-color:hsla(100,40%,50%,40%);
//  marker-line-width:3;
  
  marker-ignore-placement:true;
  marker-allow-overlap:true;
  ::label[zoom >= 14] {
    text-face-name: 'Roboto Condensed Light Italic';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,S,N";
  
    text-fill:hsla(100,40%,30%,100%);
    text-halo-fill:white;
    text-halo-radius:1;
    text-size:11;
    text-dx: 8;
  }
  
}

#waterways[waterway="river"] {
  line-width:0.5; 
  line-color:hsla(220, 0.8, 80%,0.6);
  [zoom >= 8] { 
    line-width:0.7;
    line-smooth:0.8;
    line-color:hsla(220, 0.8, 60%,0.6);
  }
  [zoom >= 14] {
    line-smooth:1.0;
    line-width: 2.5;
  }
}

#waterways[waterway="stream"],#waterways[waterway="drain"],
#waterways[waterway="canal"]{
  [zoom >= 8] {
    line-width:0.5;
    line-color:hsla(220, 0.8, 80%,0.5);
    line-smooth:0.8;
  }
  [zoom >= 13][zoom < 15] { line-width: 1; }
  [zoom = 15] { line-width: 1.75; }
  [zoom >= 16] { line-width: 2.5; }
}
// TODO properly separate rivers etc.
// currently labels on massively oversimplified ways
#waterwaylabels[waterway="river"][zoom >= 12],
#waterwaylabels[waterway="stream"][zoom >= 14],
#waterwaylabels[waterway="canal"][zoom >= 14],
#waterwaylabels[waterway="drain"][zoom >= 15]
{
    //line-color:red;
    text-face-name:'CartoGothic Std Book';
    text-size:12;
    [waterway="stream"],[waterway="drain"] {
      text-size:11;
    }
    text-name:'[name]';
    text-placement:line;
    text-fill:darken(@water,20%);
    text-halo-fill:hsla(0,0%,100%,50%);
    text-allow-overlap:true;
    text-dx:10;//kind of meaningless really.
}

#waterways[man_made='pipeline'][zoom >= 14]{
  line-width:2;
  line-color:hsla(220, 0.8, 80%,0.8);
  line-smooth:0.8;
  line-dasharray:4,2;
}


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
/*    line-width:0.5;
    line-color:hsl(100,70%,40%);
    line-smooth:0.2;*/
    line-width:0;
    // ##questionable! dots for national parks?
//    polygon-pattern-file:url(https://dl.dropboxusercontent.com/u/767553/greendot3.png);
 //   polygon-pattern-opacity:0.1;
    
    //polygon-pattern
/*    polygon-smooth:0.2;
    polygon-fill:hsla(100,50%,40%,15%);
    */
  }
  [leisure ='pitch'] { line-width: 0; } // gets applied to too much?
  [zoom >= 13][is_park=0] { 
    line-width:2;
    line-color:hsla(100,70%,40%,0.4);
    line-smooth:0.2;
    line-dasharray:4,6;
    //line-offset:4;//##
    //image-filters:agg-stack-blur(1,1);
  }
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

#waterpoly {
  polygon-fill:@water;
}

#beach[zoom >= 11] { polygon-fill:hsla(45,70%,70%,0.3); }

#stateboundaries {
  line-width: 1;
  line-color: #959;
  //[zoom >= 9] { line-dasharray:4,8; }
  [zoom >= 13] { image-filters:agg-stack-blur(2,2); }
}

/* meh, find a better icon */
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


// high voltage power lines
#power[zoom >= 14][zoom <= 15] {
    line-width:0.5;
    line-color:gray;
    line-opacity:0.75;
    line-dasharray:24,6;
    line-offset:1;
}
#power[zoom >= 16] {
  ::left {
    line-width:0.5;
    line-color:gray;
    line-opacity:0.75;
    line-dasharray:24,6;
    line-offset:1;
  }
  ::right {
    line-width:0.5;
    line-color:gray;
    line-opacity:0.75;
    line-dasharray:24,6;
    line-offset:-1;
  }
}


#skilifts[zoom >= 12] {
  line-width:0.5;
  line-color:#888;
  [zoom >= 15] {
  line-width:1;
  line-color:#888;
  }
  
  ::label[zoom >= 15] {
    text-face-name:'CartoGothic Std Book';
    text-size:10;
    text-name:'[name]';
    text-placement:line;
    text-fill:#888;
    text-halo-fill:hsla(0,0%,100%,50%);
    text-halo-radius:1;
    text-allow-overlap:true;
    text-dy:-6;
  }
}

@ferry: hsla(240, 60%, 50%, 80%);
#ferry[zoom >= 11] {
  line-width:1;
  line-color: @ferry;
  line-dasharray:4;
  [zoom >= 14] {
    text-face-name:'CartoGothic Std Book';
    text-size:10;
    text-name:'[name]';
    text-fill: @ferry;
    text-placement:line;
  }
}