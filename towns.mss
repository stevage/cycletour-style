//@townlabels: hsl(280,90%,20%);
@townlabels: hsl(60,70%,15%);
#places_cities[zoom>5] {
  text-face-name:"Roboto Condensed Regular";
  text-fill:@townlabels;
  text-size:20;
  [zoom < 9] { text-size:16;}

  text-name:'[name]';
  text-halo-radius:2;
  text-halo-fill:hsla(0,0%,100%,80%);
  text-placement-type:simple;
  text-allow-overlap:true;
  text-placements: "E,NE,SE,N,S,18,16,14,12";
}

#places_towns {
  ::marker[zoom>8] {
    [amenities < 5] {  marker-width:2+2*[amenities]; }
    [amenities >= 5] { marker-width:12; }
    marker-fill:hsla(330,80%,60%,0.6);
    marker-line-width:1;
    marker-line-color:#813;  
    marker-allow-overlap:true;
    marker-ignore-placement:true;
  }
  ::label[zoom>7]{
    text-face-name:"Roboto Condensed Light";
    text-fill:@townlabels;
    [zoom >=9] { text-size: 16; }
    [zoom=8] { text-size: 12; }
    [zoom <= 7] { text-size:8;  }
  //  text-allow-overlap:true;
    text-name:'[name]';
    text-halo-radius:1.5;
    text-placement-type:simple;
    text-placements: "E,NE,SE,N,S,18,16,14,12";
    text-dx: 6;
  }
}

#places[place = 'village'][amenities >= 1][zoom >=8],
#places[place='hamlet'][amenities >= 1][zoom >=8]  {
  
  ::label[zoom >= 8] {
    text-face-name: 'Roboto Condensed Light';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,S,N";
  
    text-fill:hsl(280,50%,30%);
    text-halo-fill:white;
    text-halo-radius:1;
    text-size:10;
    [zoom >= 14] { text-size:14; }
    text-dx: 4;
  }
  ::marker[zoom >8] {
    [amenities < 5] {  marker-width:2+2*[amenities]; }
    [amenities >= 5] { marker-width:12; }
    [amenities < 1] { marker-opacity:0; }
    marker-line-width:0;
    marker-line-color:#813;  
    marker-allow-overlap:true;
    marker-ignore-placement:true;
    marker-fill:hsla(330,80%,60%,0.8);
    [zoom > 8] { marker-line-width:0; }
    [amenities < 1] { marker-fill-opacity:0; }
  }
  /*
  [zoom >= 8] { marker-width: 3;} 
  [zoom = 7] { marker-width: 3;} 
  [zoom = 6] { marker-width: 2;} 
  [zoom <= 5] { marker-width: 1;}*/ 
}

@bikeroute: hsla(20,80%,40%,1.0);
#bikepaths {
  ::glow {
    line-width:3; line-smooth:0.6;
    line-color: hsla(210, 80%, 60%, 0.5);
    [rail_trail=1] { 
      line-width:6; line-smooth:0.6;
      line-color:hsla(60,80%,60%,0.5);
      
    }
  }
  ::extraglow[rail_trail=1] {
    line-width:14; line-smooth:0.6;
    line-color:hsla(60,80%,60%,0.4);
    image-filters: agg-stack-blur(2,2);
    [state="proposed"],[state="construction"] {
      line-color:hsla(180, 80%, 60%, 0.4);
      line-width:8;
    }
  }
  // a white carpet around the path makes a huge difference in prominnce
  ::carpet[state=''] { 
    line-width:4; line-smooth: 0.6; line-color: white; 
  }
  line-width:2; line-smooth:0.6;
  line-color:@bikeroute;
    ::label[zoom >= 11] {
      text-face-name:'Roboto Condensed Regular';
      text-size:12;
      text-name:'[route_name]';
      text-placement:line;
      text-allow-overlap:true;
      text-spacing:100;
      text-fill:hsla(10,80%,20%,90%);
      text-halo-fill:hsla(0,0,100%,80%);
      text-halo-radius:2;      
      [state="construction"],[state="proposed"] {
        text-size:10;
      }
    }
  
  [state="construction"] {
    line-dasharray:4,4;
  }
  [state="proposed"] {
    line-dasharray:4,8;
  }
  [state="construction"],[state="proposed"] {
    line-width: 1;
//    ::glow { line-width: 0; }
  }
  
}

#bikepathsplain[zoom >=10][highway='cycleway']  {
  line-width:1;
  [zoom < 13] { line-width: 0.5; }
  line-color:@bikeroute;
  line-smooth:0.8;
}




#places_pointless[zoom >= 12] {
  marker-width:2;
  marker-fill:hsla(270,30%,30%,40%);
  marker-allow-overlap:true;
  ::label[zoom >= 13] {
    text-face-name: 'Roboto Condensed Regular';
    text-name: '[name]';
    text-placement-type:simple;
    text-placements: "E,S,N";
  
    text-fill:hsla(270,30%,30%,50%);
    text-halo-fill:white;
    text-halo-radius:0;
    text-size:9;
    text-dx: 4;
  }
}
