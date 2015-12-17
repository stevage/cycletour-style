@water: hsl(210, 80%,82%); //#b8dee6;
//@water: hsl(210, 80%,62%); //#b8dee6;
//@background:#f0fff0;
@background:#f0fff0;

Map {
  //background-color: @background;
  background-color:lighten(@water,10%);
  
  //buffer-size:1024;
}
#waterpoly {
  polygon-fill:@water;
}
#landpolygons[zoom >= 10] { polygon-fill: @background; }
#landpolygon-lowzoom[zoom < 10] { polygon-fill: @background; }

#coastline::deepsea {
    line-color: hsl(180,40%,40%);
    line-width: 20;
    line-join: round;
    image-filters: agg-stack-blur(80,80);
  }
#coastline::shore {
    line-color: hsl(200,80%,70%);
    line-width: 5;
    line-join: round;
    image-filters: agg-stack-blur(5,5);
}


 

@roadsize: 1.0;
//@minorroad: 0.45;
@littleroad:0.4;
@roadzoom10: 1.2;
@roadzoom11: 1.4;
@roadzoom12: 2.5;
@roadzoom13: 3;
@roadzoom14: 4;
@roadzoom15: 5;
@roadzoom16: 8;

@bigroad: gray;
@minorroad: hsl(260,20%,60%);
@bigroad_inner: #999; 
@bridgegap: 4;
@carpetgap:2;
@carpet:hsla(0,0%,100%,50%);
@bikelane: hsla(20,80%,40%,1.0);

#roads[zoom >= 9][access != 'private'][access != 'no'][bicycle != 'no'],
#roads[zoom >= 12]
{
  [bridge="yes"][zoom >= 14]::bridge {
    line-color:@bigroad;
    line-width: @roadsize;
    line-cap:butt;
    [zoom = 14] { line-width: @roadsize * @roadzoom14+@bridgegap; }
    [zoom = 15] { line-width: @roadsize * @roadzoom15+@bridgegap; }
    [zoom >= 16] { line-width: @roadsize * @roadzoom16+@bridgegap; }
  }
  ::carpet
  {
    line-width:@roadsize + @carpetgap; 
    line-color:@carpet;
    //[zoom = 9] { line-color:hsla(100,50%,80%,0.5); }
    [zoom = 10] { line-width: @roadsize * @roadzoom10+@carpetgap; }
    [zoom = 11] { line-width: @roadsize * @roadzoom11+@carpetgap; }
    [zoom = 12] { line-width: @roadsize * @roadzoom12+@carpetgap; }
    [zoom = 13] { line-width: @roadsize * @roadzoom13+@carpetgap; }
    [zoom = 14] { line-width: @roadsize * @roadzoom14+@carpetgap; }
    [zoom = 15] { line-width: @roadsize * @roadzoom15+@carpetgap; }
    [zoom >= 16] { line-width: @roadsize * @roadzoom16+@carpetgap; }
    [highway='trunk'] { line-width: 3.5;}  
    line-smooth:0.45;

    // experimental way of showing bike lanes
    [cycleway='lane'][zoom >= 14],
    [cycleway='track'][zoom >= 14]{ line-color:lighten(@bikelane,20%); }
  }
}
#roads[zoom >= 9][access != 'private'][access != 'no'][bicycle != 'no'],
#roads[zoom >= 12]
 {
   
  line-color:@bigroad;
  [highway='motorway'],[highway='trunk'] { line-color: black; }
  [highway='primary'] { line-color:hsl(260,20%,30%); }
  [highway='secondary'] { line-color:hsl(260,20%,45%); }
  line-width: @roadsize;
  line-cap:square;
  [unsealed="yes"] { 
    line-dasharray: 6,1;
    line-cap:butt;
  }
  [zoom = 10] { line-width: @roadsize * @roadzoom10; }
  [zoom = 11] { line-width: @roadsize * @roadzoom11; }
  [zoom = 12] { line-width: @roadsize * @roadzoom12; }
  [zoom = 13] { line-width: @roadsize * @roadzoom13; }
  [zoom = 14] { line-width: @roadsize * @roadzoom14; }
  [zoom = 15] { 
    line-width: @roadsize * @roadzoom15; 
    ::inside {
      line-width: @roadsize * @roadzoom15 - 2;
      line-color: @bigroad_inner;
      line-smooth:0.45;
      line-cap:round;
      line-join:round;
      [unsealed="yes"] { 
        line-dasharray: 6,1;
        line-cap:butt;
      }
    }
  }
  [zoom >= 16] { 
    line-width: @roadsize * @roadzoom16; 
    ::inside {
      line-width: @roadsize * @roadzoom16 - 2;
      line-color: @bigroad_inner;
      line-smooth:0.45;
      [unsealed="yes"] { 
         line-dasharray: 6,1;
       }
    }
  }
  line-smooth:0.4;
  [zoom >= 14] { line-smooth: 0.5; }
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
  }
  [access='private'],[access='no'],[bicycle='no'] { 
    line-color: hsla(0,0%,100%,75%); // ##todo how to represent these? 
  }
}

@minorroad_s: 0.9;
@mcarpetgap:1;
// Separate carpet for minor roads so that walking route can be displayed between it
// and the main road surface. Otherwise the walking route is invisible.
#minorroadscarpet[bridge="yes"][zoom >= 14]::bridge {
  line-color:@bigroad;
  line-width: @roadsize;
  line-cap:butt;
  line-smooth:0.3;
  [zoom >= 15] { line-smooth: 0.5; }
  [zoom = 14] { line-width: @minorroad_s * @roadzoom14+@bridgegap; }
  [zoom = 15] { line-width: @minorroad_s * @roadzoom15+@bridgegap; }
  [zoom >= 16] { line-width: @minorroad_s * @roadzoom16+@bridgegap; }
}
  
#minorroadscarpet[zoom >= 9]::carpet {
  line-smooth:0.3;
  [zoom >= 15] { line-smooth: 0.5; }
  line-width:@minorroad_s + @carpetgap; 
  line-color:@carpet;
  [zoom = 9] { line-color:hsla(100,50%,80%,0.5); }
  [zoom = 10] { line-width: @minorroad_s * @roadzoom10+@mcarpetgap; }
  [zoom = 11] { line-width: @minorroad_s * @roadzoom11+@mcarpetgap; }
  [zoom = 12] { line-width: @minorroad_s * @roadzoom12+@mcarpetgap; }
  [zoom = 13] { line-width: @minorroad_s * @roadzoom13+@mcarpetgap; }
  [zoom = 14] { line-width: @minorroad_s * @roadzoom14+@mcarpetgap; }
  [zoom = 15] { line-width: @minorroad_s * @roadzoom15+@mcarpetgap; }
  [zoom >= 16] { line-width: 0; }
  
  // experimental way of showing bike lanes
  [cycleway='lane'][zoom >= 14],
  [cycleway='track'][zoom >= 14]{ 
    line-color:lighten(@bikelane,20%); 
  }
}

#minorroads[zoom >= 9][access != 'private'][access != 'no'][bicycle != 'no'],
#minorroads[zoom >=12]{
  
  // main road layer
  line-color:@minorroad;
  line-width: @minorroad_s;
  line-cap:butt;
  line-smooth:0.3;
  [zoom >= 15] { line-smooth: 0.5; }
  [unsealed="yes"] { 
    line-dasharray: 6,1;
  }
  [zoom = 10] { line-width: @minorroad_s * @roadzoom10; }
  [zoom = 11] { line-width: @minorroad_s * @roadzoom11; }
  [zoom = 12] { line-width: @minorroad_s * @roadzoom12; }
  [zoom = 13] { line-width: @minorroad_s * @roadzoom13; }
  [zoom = 14] { line-width: @minorroad_s * @roadzoom14; }
  [zoom = 15] { 
    line-width: @minorroad_s * @roadzoom15;
    line-cap: butt;
    ::inside {
      line-width: @minorroad_s * @roadzoom15 - 2;
      line-color: lighten(@minorroad,20%);
      line-smooth:0.45;
      line-cap:square;
      [unsealed="yes"] { 
        line-dasharray: 5,2;
        line-dash-offset:1;
      }
    }
  }
  [zoom >= 16] { 
    line-width: @minorroad_s * @roadzoom16; 
    line-cap:butt;
    [unsealed="yes"] { 
      line-dasharray: 4,3;
    }
    ::inside {
      line-width: @minorroad_s * @roadzoom16 - 2;
      line-color: lighten(@minorroad, 20%);
      line-smooth:0.45;
      line-cap:butt;
      [unsealed="yes"] { 
         line-dasharray: 5,2;
        line-dash-offset:-1;
       }
    }
  }
  [access='private'],
  [access='no'],
  [bicycle='no'] { 
    line-color: hsla(0,0%,100%,75%); // ##todo how to represent these? 
  }
}

#minorroads[zoom >= 10]::label {
  text-face-name:'Roboto Condensed Light';
  text-name:'[name]';
  text-placement:line;
  text-allow-overlap:false;//true;
  text-spacing:150;
  text-halo-radius: 1; 
  text-halo-fill: hsla(0,0%,1.0,50%);
  text-size: 10;
  text-fill:hsl(0,0%,20%);
  [zoom <= 11] { text-fill:hsl(0,0%,50%); }
  [zoom = 12] { text-fill:hsl(0,0%,40%); }
  [zoom = 13] { text-fill:hsl(0,0%,20%); }
  
}


// Residential, service etc, which disappear on low zooms. 
#littleroads[zoom >= 10][highway='residential'],
#littleroads[zoom >= 11][service != 'parking_aisle'],
#littleroads[zoom >= 16][service = 'parking_aisle']
{
  line-width: @littleroad;
  [zoom >= 10] { line-width: @littleroad * @roadzoom10; }
  [zoom = 12] { line-width: @littleroad * @roadzoom12*0.75; }
  [zoom = 13] { line-width: @littleroad * @roadzoom13*0.75; }
  [zoom = 14] { line-width: @littleroad * @roadzoom14 * 0.75; }
  [zoom = 15] { line-width: @littleroad * @roadzoom15 * 0.75; }
  [zoom >= 16] { line-width: @littleroad * @roadzoom16; }

  line-smooth:0.3;
  [zoom >= 15] { line-smooth: 0.5; }

  line-color:gray;
  [surface="unpaved"],[surface="dirt"],[surface="gravel"],
  [surface="unsealed"],[surface="sand"] { 
    line-dasharray: 6,1;
    line-color:hsl(30,20%,40%);
  }
  ::label[zoom >= 14] {
    //text-face-name:'CartoGothic Std Book';
    text-face-name:'DejaVu Sans Condensed';
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:false;//true;
    text-spacing:150;
    //text-fill:#777;
    
    text-fill: #555;
    text-size:9;
    text-halo-radius: 1; text-halo-fill: hsla(0,0%,1.0,50%);
    [zoom >= 15] { 
      text-size: 10; 
      text-halo-radius: 1; 
      text-halo-fill: hsla(0,0%,1.0,80%);
      text-fill: #333;
   }
    [zoom >= 16] { 
      text-halo-radius:1.5;
      text-size:11;
    }
  }
}

#minorroads[zoom >= 14][oneway="yes"]::arrow,
#littleroads[zoom >= 14][oneway="yes"]::arrow {
  
  marker-type:arrow;
  marker-fill:white;
  marker-width:6;
  marker-placement:line;
}

#littleroads[zoom >= 14][access='private'],
#littleroads[zoom >= 14][access='no'],
#littleroads[zoom >= 14][bicycle='no'] { 
  line-color: hsla(0,0%,100%,75%); // ##todo how to represent these? 
}

    
@link: 0.5; 
#roadlinks[zoom>=13] {
  [zoom = 13] { line-width: @link * @roadzoom13; }
  [zoom = 14] { line-width: @link * @roadzoom14; }
  [zoom = 15] { line-width: @link * @roadzoom15; }
  [zoom >= 16] { line-width: @link * @roadzoom16; }
  line-color:#999;
}


@track: 0.3;
#tracks[zoom >= 9]
{
  line-smooth:0.6;
  line-width:@track;
  line-color:brown;
  [zoom = 10] { line-width: @track * @roadzoom10; }
  [zoom = 11] { line-width: @track * @roadzoom11; }
  [zoom = 12] { line-width: @track * @roadzoom12; }
  [zoom = 13] { line-width: @track * @roadzoom13; }
  [zoom = 14] { line-width: @track * @roadzoom14 * 1.25; }
  [zoom = 15] { line-width: @track * @roadzoom15 * 1.5; }
  [zoom >= 16] { line-width: @track * @roadzoom16 * 1.5; }
  
      
      
  line-dasharray:2,0.5; 
  [zoom >= 12] { line-dasharray:3,2; }
  [zoom >= 14] { line-dasharray:4,2; }
  [zoom >= 15] { line-dasharray:5,2; }
  [surface="sand"] {
    [zoom >= 12] { line-dasharray:3,6; }
    [zoom >= 14] { line-dasharray:4,8; }
    [zoom >= 15] { line-dasharray:4,10; }
  }
  [zoom >= 12][fourwd='yes']::ticks { 
	line-color:brown;
    line-smooth:0.6;
    line-width:2.5;
    [zoom >= 14] { line-width: 4;}
    line-dasharray: 1,79;
    line-dash-offset:1;
  }

  // 
  [zoom = 14] {
    line-offset:0.5;
    line-width: 0.5;
    line-dasharray:8,2;
  }
    // experimental "dual track view"
  [zoom > 14] {
    line-offset:1.5;
    line-width: 0.5;
    line-dasharray:100,0;
    [zoom = 14] { line-offset: 1; }
    ::left {
      line-smooth:0.6;
      line-width: 0.5;
      line-color:brown;
      line-offset:-1.5;
      [zoom = 14] { line-offset: 1; }
      //[zoom >= 15] { line-dasharray:5,2; }
    }
  }  
}

#tracks[zoom >= 12][access='private'],
#tracks[zoom >= 12][access='no'],
#tracks[zoom >= 12][bicycle='no'] { 
  line-color: hsla(0,0%,100%,75%); // ##todo how to represent these? 
}


#tracks::label[zoom >= 12] {
    text-face-name:'CartoGothic Std Book';
    text-size:11;
    [zoom = 13] { text-size: 10; }
    [zoom = 12] { text-size: 7; }
    text-name:'[name]';
    text-placement:line;
    text-allow-overlap:false;//true;
    text-dy:6;
    text-spacing:140;
    text-halo-fill:hsla(0,0%,100%,40%);
    text-halo-radius:1;
    text-fill:darken(brown,10%);
    text-opacity:0.8;
  }



#rail[zoom >= 8] {
  ::bridge[zoom >= 14][bridge="yes"] {
    carpet/line-color:white;
    carpet/line-width:6;
    
    sides/line-color:hsl(60,80%,20%);
    sides/line-width:5;

    innercarpet/line-color:white;
    innercarpet/line-width:3;
    
  }
  ::altdashes {line-width:0;}
  ::dots {line-width:0;}
  line-width:1;
  line-color:hsl(140,80%,40%);
 }

#rail[railway="preserved"][zoom >=8]{ 
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
}
#rail[zoom >= 14]::label {
  text-face-name:'CartoGothic Std Italic';
  text-fill:hsla(140,70%,30%,80%);
  text-size:11; 
  text-name:'[name]';
  text-placement:line;
  text-allow-overlap:true;
  text-halo-fill:hsla(0,0%,100%,40%);
  text-halo-radius:1;
  
  [railway="preserved"] {
    text-face-name:'CartoGothic Std Book';
    text-fill:hsl(140,70%,30%);
    text-halo-fill:hsla(0,0%,100%,60%);
  }
}



// Actual services
#trains {
  ::carpet[zoom >=10] {
    line-width:5;
    line-color: hsla(0,0%,100%,40%);
    line-rasterizer:fast;
  }
  line-width:2;
  line-rasterizer:fast;
  [zoom <=7] { line-width: 1; }
  [zoom = 8] { line-width: 1.5; }
  line-color:hsl(140,80%,40%);
  ::dots[zoom >=10] { 
    line-width:2.5;
    line-color:hsl(140,80%,20%);
    line-dasharray:4,4;
    line-rasterizer:fast;
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
  marker-line-width:1;
  [zoom >= 12] { marker-line-width:1;}
  [zoom >= 12] { 
    marker-allow-overlap:true; 
    marker-ignore-placement:true;
  }
  ::label[zoom >= 13] {
    text-face-name: 'Roboto Condensed Regular';
    
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,S,N,W,12,11,10,9";
  
    text-fill:hsla(100,40%,40%,100%);
    text-halo-fill:hsla(0,0,100%,60%);
    text-halo-radius:2;
    text-size:11;
    text-dx: 6;
    // Major stations and termini 
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
    [name='Geelong'],
    [name='Lilydale']
      
      {
      text-face-name:"Roboto Condensed Bold";
      text-size: 14;
      text-allow-overlap:true;
    }
    
  }
}
// Old rail lines, interesting to rail buffs and rail trail nerds,

#oldrail[zoom >= 10] {
  ::bridge[zoom >= 14][bridge="yes"] {
    carpet/line-color:white;
    carpet/line-width:6;
    
    sides/line-color:hsl(60,80%,20%);
    sides/line-width:5;

    innercarpet/line-color:white;
    innercarpet/line-width:3;
    
  }
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
  line-rasterizer:fast;
  [zoom >= 8] { 
    line-width:0.7;
    [zoom >= 10] { line-smooth:0.8; }
    line-color:hsla(220, 0.8, 60%,0.6);
  }
  [zoom >= 14] {
    line-smooth:1.0;
    line-width: 2.5;
  }
  [zoom = 15] { line-width: 4; }
  [zoom >= 16] { line-width: 6; }
    
}

#waterways[waterway="stream"],#waterways[waterway="drain"],
#waterways[waterway="canal"]{
  [zoom >= 9] {
    line-width:0.5;
    line-color:hsla(220, 0.8, 80%,0.5);
    line-smooth:0.8;
    line-rasterizer:fast;
  }
  [zoom = 13]{ line-width: 1; }
  [zoom = 14]{ line-width: 1.5; }
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
    text-halo-radius:1;
  text-halo-fill:hsla(240,40%,90%,50%);
}

#waterways[man_made='pipeline'][zoom >= 14]{
  line-width:2;
  line-color:hsla(220, 0.8, 80%,0.8);
  line-smooth:0.8;
  line-dasharray:4,2;
  line-rasterizer:fast;
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
    line-dasharray: 4,8;
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


