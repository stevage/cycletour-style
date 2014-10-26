@pathzoom10: 1.5;
@pathzoom11: 2;
@pathzoom12: 2.5;
@pathzoom13: 3;
@pathzoom14: 3.5;
@pathzoom15: 4;
@pathzoom16: 5;

@bikeroute: hsla(20,80%,40%,1.0);

@bikepath:1.25;
#bikeroutes[mtb=0] {
  // a white carpet around the path makes a huge difference in prominence
  ::carpet[state=''][zoom>=9] {
    line-width: @bikepath + 2;
    [zoom = 10] { line-width: @mtbroute * @pathzoom10 + 2}
    [zoom = 11] { line-width: @mtbroute * @pathzoom11 + 2}
    [zoom = 12] { line-width: @bikepath * @pathzoom12 + 2}
    [zoom = 13] { line-width: @bikepath * @pathzoom13 + 2}
    [zoom = 14] { line-width: @bikepath * @pathzoom14 + 2}
    [zoom = 15] { line-width: @bikepath * @pathzoom15 + 2}
    [zoom >= 16] { line-width: @bikepath * @pathzoom16 + 2}

    line-width:4; line-smooth: 0.6; line-color: white; 
    line-rasterizer:fast;
    [zoom=9] { line-width:3; line-color: hsla(0,0%,100%,50%);}
  }
  // Rail trails are super prominent at low zooms with a yellow highlight.
  ::glow[rail_trail=1] {
      line-width:6; line-smooth:0.6;
      line-color:hsla(60,80%,60%,0.5);
      line-rasterizer:fast;
  }
  ::extraglow[rail_trail=1] {
    line-width:8; line-smooth:0.6;
    line-rasterizer:fast;
    [zoom >= 12] { line-width: 8; }
    [zoom >= 14] { line-width: 12; }
    [zoom >= 15] { line-width: 14; }
    line-color:hsla(60,80%,60%,0.7);//0.4
    image-filters: agg-stack-blur(2,2);
    [state="proposed"],[state="construction"] {
      line-color:hsla(180, 80%, 60%, 0.4);
      line-width:8;
      [zoom >= 12] { line-width: 4; }
    }
  }
  // main bike route line - reddish
  line-width: @bikepath;
  [zoom >= 10] { line-width:@bikepath * @pathzoom10}
  [zoom = 11] { line-width: @bikepath * @pathzoom11}
  [zoom = 12] { line-width: @bikepath * @pathzoom12}
  [zoom = 13] { line-width: @bikepath * @pathzoom13}
  [zoom = 14] { line-width: @bikepath * @pathzoom14}
  [zoom = 15] { line-width: @bikepath * @pathzoom15}
  [zoom >= 16] { line-width: @bikepath * @pathzoom16}

  line-smooth:0.6;
  line-color:@bikeroute;
  line-rasterizer:fast;
  [zoom >= 14] { 
    line-color:lighten(@bikeroute,10%);
    line-smooth: 0.6;
  }
  
  ::label[zoom >= 11],
    ::label[zoom=10][rail_trail=1]{
    text-face-name:'Roboto Condensed Regular';
    text-size:12;
    text-name:'[route_name]';
    text-placement:line;
    [route_name != 'Capital City Trail'] { text-allow-overlap:true; }
    text-spacing:140;
    text-max-char-angle-delta:40;
    text-fill:hsla(10,80%,20%,90%);
    text-halo-fill:hsla(0,0,100%,80%);
    text-halo-radius:2;
    text-halo-rasterizer:fast;
    [zoom=10] { text-halo-radius:1; text-size:10;}
    
    [state="construction"],[state="proposed"] {
      text-face-name:'Roboto Condensed Light';
      text-size:10;
      text-halo-radius:1;
      text-halo-fill:hsla(0,0,100%,50%);

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
@mtbroute: 1.5;
#mtbroutes[zoom >= 10],
#mtbroutes[route_name="Mawson Trail"]/*,
#mtbroutes[route_name="Kidman Trail"]*/

{
  line-width:@mtbroute ;
  [zoom = 12] { line-width: @mtbroute * @pathzoom12}
  [zoom = 13] { line-width: @mtbroute * @pathzoom13}
  [zoom = 14] { line-width: @mtbroute * @pathzoom14}
  [zoom = 15] { line-width: @mtbroute * @pathzoom15}
  [zoom >= 16] { line-width: @mtbroute * @pathzoom16}
  line-smooth:1;
  line-color:hsla(340,50%,90%,100%);  
  [route_name=~"Bicentennial National Trail.*"],
  [route_name="Mawson Trail"]
  /*[route_name="Kidman Trail"]*/ {
    line-color:hsla(50,100%,40%,85%);
    [zoom <= 10] { line-width:3; }
    [zoom = 11] { line-width: @mtbroute * @pathzoom11 *1.5 }
    [zoom = 12] { line-width: @mtbroute * @pathzoom12 *2}
    [zoom = 13] { line-width: @mtbroute * @pathzoom13 * 2}
    [zoom = 14] { line-width: @mtbroute * @pathzoom14 * 2}
    [zoom = 15] { line-width: @mtbroute * @pathzoom15 * 2}
    [zoom >= 16] { line-width: @mtbroute * @pathzoom16 * 2}
    line-dasharray:1,0;
    //image-filters:agg-stack-blur(2,2);
  }
}
#mtbroutelabels[zoom >= 14] {
  text-face-name:'Roboto Condensed Light';
  text-size:10;
  text-name:'[route_name]';
  [zoom = 15] { text-size: 12;}
  [zoom >= 16] { text-size: 14; }
  text-placement:line;
  text-allow-overlap:true;
  text-spacing:140;
  text-max-char-angle-delta:40;
  text-fill:hsla(40,80%,30%,100%);
  text-halo-fill:hsla(340,50%,95%,70%);
  text-halo-radius:1.5;
}

@bikepathplain: 0.75;
#bikepathsplain[zoom >=10]
{
  line-width:@bikepathplain;
  [zoom >= 10] { line-width: @bikepathplain * @pathzoom10; }
  [zoom = 13] { line-width: @bikepathplain * @pathzoom13; }
  [zoom = 14] { line-width: @bikepathplain * @pathzoom14; }
  [zoom = 15] { line-width: @bikepathplain * @pathzoom15; }
  [zoom >= 16] { line-width: @bikepathplain * @pathzoom16; }
  [bridge="yes"][zoom >=13]::bridge {
    b1/line-color:#555;
    b1/line-width:1.0;
    b1/line-offset:3;
    b2/line-color:#555;
    b2/line-width:1.0;
    b2/line-offset:-3;
    
  }
  line-color:@bikeroute;
  line-smooth:0.8;
  [mtb="yes"] { line-dasharray:2,1; }
}
@walkingpath: 0.5;
#walkingpaths[zoom >= 12] {
  line-dasharray:1,2;
  line-color:hsl(110,90%,20%);

  line-width:@walkingpath;
  [zoom = 13] { line-width: @walkingpath * @pathzoom13; }
  [zoom >= 14] { line-width:  @walkingpath * @pathzoom14; }
  [zoom >= 15] { line-width:  @walkingpath * @pathzoom15; line-smooth: 1;}
  [zoom >= 16] { line-width:  @walkingpath * @pathzoom16; }
  
  [zoom >= 12] { 
    line-dasharray:1,1;   
    line-color:hsl(110,90%,30%); 
  }
  [zoom >= 14] { line-dasharray: 2,1.5;}
  [zoom >= 15] {
      text-face-name:'Roboto Condensed Regular';
      text-size:10;
      text-name:'[name]';
      text-placement:line;
      text-allow-overlap:true;
      text-spacing:100;
      text-vertical-alignment:top;
      text-fill:hsla(110,90%,30%,50%);
      text-halo-fill:hsla(0,0,100%,60%);
      text-halo-radius:1;      
  }    
  [highway="steps"] { line-width: 3; line-dasharray: 1,2;} 
}

#walkingroutes[zoom >= 9] {
//  line-width:1;
//  line-color:#168;
  
  line-color:hsla(100,80%,40%,80%);
  line-width:3;
  line-dasharray:1,0;
  //line-smooth:0.5;
  //image-filters:agg-stack-blur(2,2);
  [zoom >= 14]::label {
      text-face-name:'Roboto Condensed Regular';
      text-size:1;
      text-name:[name];
      [name="Austalian Alps Walking Track"] {
        text-name:"'AAWT'";
      }
      text-placement:line;
      text-allow-overlap:true;
      text-spacing:150;
      text-vertical-alignment:top;
      text-fill:hsla(100,80%,20%,100%);
      text-halo-fill:hsla(0,0,100%,60%);
      text-halo-radius:1;      
  }    
}

#pedestrian[zoom >= 16] { 
  line-color: lighten(@bikeroute,10%);
  line-opacity:50%;
  polygon-fill: lighten(@bikeroute,50%);
  polygon-opacity:5%;

}