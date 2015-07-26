//@townlabels: hsl(280,90%,20%);
@townlabels: hsl(60,70%,10%);
//@villagelabels: hsl(280,50%,25%); //purple
@villagelabels: hsl(60,40%,10%);
//@townblobs: hsla(330,80%,60%,0.8);
//@townblobs: hsla(260,80%,40%,0.7);
@townblobs: hsla(260,80%,40%,0.0);

#places_cities[zoom>=6] {
  text-face-name:"Roboto Condensed Regular";
  text-fill:@townlabels;
  text-dx:5;
  text-name:'[name]';
  text-halo-radius:1;
  text-halo-fill:hsla(0,0%,100%,80%);
  text-size:12;
  [zoom >= 7] { text-size: 14; }
  [zoom >= 8] { text-size:16; text-halo-radius:2; }
  [zoom >= 10] { text-size:28; text-opacity:0.7;}
  [zoom >= 13] { 
    text-opacity:0.4; text-halo-fill:hsla(0,0%,100%,30%);
    text-size:48; 
  }

  text-placement-type:simple;
  text-allow-overlap:true;
  text-placements: "E,NE,SE,N,S,18,16,14,12,10,8";
}

#places_towns::label[zoom>=7] {
    text-face-name:"Roboto Condensed Light";
    text-fill:@townlabels;
    text-name:'[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,N,S,W,SW,NW,8";
	text-dx:2;
    text-dy:2;

    text-size:8;
    text-placements: "E,NE,SE,N,S,W,SW,NW,18,16,14,12";
    [zoom = 7] { text-fill: lighten(@townlabels,15%); }
    [zoom = 8] { 
      text-size: 12; 
      text-halo-radius:1.5; 
      text-halo-fill:hsla(60,5%,90%,50%);
      //text-placements: "E,NE,SE,N,S,W,SW,NW,12,10,8";
    }
    [zoom >= 9] { 
      text-size:14; 
      text-halo-radius:1.5; 
      text-halo-fill:hsla(60,5%,95%,70%);
      //text-placements: "E,NE,SE,N,S,W,SW,NW,14,12,10,8";
    }
    [zoom >= 10] { 
      text-size:16; 
      //text-placements: "E,NE,SE,N,S,W,SW,NW,16,14,12,10";
    }
    [zoom >= 10] { text-size:16; }
    [zoom >= 11] { text-size:18; }
    [zoom >= 12] { text-size:20; }
    [zoom >= 13] { 
      text-opacity:0.6; text-halo-fill:hsla(0,0%,100%,30%);
      text-size:24; 
    }
    text-allow-overlap:false;
}

#places[place = 'village'][amenities >= 1][zoom >=8],
#places[place='hamlet'][amenities >= 1][zoom >=10],
#places[place='locality'][amenities >= 1][zoom >=13] {
  
  ::label[zoom >= 8] {
    text-face-name: 'Roboto Condensed Light';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,N,S,W,SW,NW,10,9,8";
  
    text-fill:@villagelabels;
    text-halo-fill:hsla(300,20%,98%,60%);
    text-halo-radius:1.5;
    text-size:10;
    
    text-halo-rasterizer:full;
    [zoom <= 8] { text-halo-radius:0.5; }
    [zoom <= 9] { text-opacity: 0.8; }
    [zoom >=10] { text-size: 11; text-opacity:0.9;}
    [zoom >=11] { text-size: 12; text-opacity:0.9;}
    [zoom >=12] { text-size: 14; text-opacity:0.9;}
    [zoom >=14] { text-size: 16; text-opacity:1.0;}
    [zoom >=15] { text-size: 20; text-opacity:1.0;}
    text-dx: 4;
    text-dy:5;
    [zoom >= 14] { 
      text-placements: "E,NE,SE,N,S,W,SW,NW,14,12,10,9,8";
      //text-allow-overlap:true;
    }
    [place='locality'] { 
      text-size:10; 
    }
  }
}

#suburbs[zoom >=13] {
  
  ::label[zoom >= 8] {
    text-face-name: 'Roboto Condensed Light';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,N,S,W,SW,NW,10,9,8";
  
    text-fill:@villagelabels;
    text-halo-fill:hsla(300,20%,98%,60%);
    text-halo-radius:1.5;
    text-size:10;
    [zoom >=12] { text-size: 13; text-opacity:0.9;}
    [zoom >=14] { text-size: 14; text-opacity:1.0;}
    text-dx: 4;
    text-dy:5;
    [zoom >= 14] { 
      text-placements: "E,NE,SE,N,S,W,SW,NW,14,12,10,9,8";
      //text-allow-overlap:true;
    }
  }
}

#places_pointless[zoom >= 12] {
  marker-width:4;
  marker-fill:hsla(270,30%,30%,40%);
  marker-allow-overlap:true;
  marker-line-width:0;
  ::label[zoom >= 13] {
    text-face-name: 'Roboto Condensed Regular';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,S,N,W";

  
    text-fill:hsla(270,30%,30%,50%);
    text-halo-fill:white;
    text-halo-radius:0;
    text-size:9;
    [zoom >= 14] { text-size:11; }

    text-dx: 4;
    text-dy: 4;
  }
}

#suburbs[zoom >= 14]  ::label[zoom >= 13] {
    text-face-name: 'Roboto Condensed Regular';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,NE,SE,S,N,W";

  
    text-fill:hsla(270,30%,30%,50%);
    text-halo-fill:white;
    text-halo-radius:0;
    text-size:9;
    [zoom >= 14] { text-size:11; }

    text-dx: 4;
    text-dy: 4;
  }
