
@bikeroute: hsla(20,80%,40%,1.0);
#bikeroutes[mtb=0] {
  // a white carpet around the path makes a huge difference in prominence
  ::carpet[state=''][zoom>=9] { 
    line-width:4; line-smooth: 0.6; line-color: white; 
    [zoom=9] { line-width:3; line-color: hsla(0,0%,100%,50%);}
  }
  ::glow[rail_trail=1] {
      line-width:6; line-smooth:0.6;
      line-color:hsla(60,80%,60%,0.5);
  }
  ::extraglow[rail_trail=1] {
    line-width:8; line-smooth:0.6;
    [zoom >= 12] { line-width: 8; }
    line-color:hsla(60,80%,60%,0.7);//0.4
    image-filters: agg-stack-blur(2,2);
    [state="proposed"],[state="construction"] {
      line-color:hsla(180, 80%, 60%, 0.4);
      line-width:8;
      [zoom >= 12] { line-width: 4; }
    }
  }
  // main bike route line - reddish
  line-width:2; line-smooth:0.6;
  [zoom <= 9] { line-width:1; }
  line-color:@bikeroute;
  [zoom >= 14] { 
    line-width:3; 
     line-color:lighten(@bikeroute,10%);
    line-smooth: 0.6;     line-width:1.0;
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

#mtbroutes[zoom >= 10] {
  line-width:1.5 ;
  [zoom = 12] { line-width: 4;}
  [zoom >= 13] { line-width: 5;}
  [zoom >= 15] { line-width: 7;}
  line-smooth:1;
  line-color:hsla(340,50%,90%,100%);  
  [route_name="Bicentennial National Trail"] {
    line-color:hsla(50,100%,40%,80%);
    [zoom < 12] { line-width:3; }
    line-dasharray:1,0;
    //image-filters:agg-stack-blur(2,2);
  }
}
#mtbroutelabels[zoom >= 14] {
  text-face-name:'Roboto Condensed Light';
  text-size:10;
  text-name:'[route_name]';
  text-placement:line;
  text-allow-overlap:true;
  text-spacing:140;
  text-max-char-angle-delta:40;
  text-fill:hsla(40,80%,30%,100%);
  text-halo-fill:hsla(0,0,100%,50%);
  text-halo-radius:1.5;
}


#bikepathsplain[zoom >=10]
{
  line-width:1.5;
  [zoom < 13] { line-width: 0.5; }
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

#walkingpaths[zoom >= 12] {
  line-width:1;
  
  line-dasharray:1,2;
  line-color:hsl(110,90%,20%);
  [zoom = 12] { 
    line-width: 0.5; line-dasharray:1,1;   
    line-color:hsl(110,90%,30%); 
  }
  [zoom = 13] { line-width: 0.7; }
  [zoom >= 14] { line-width: 1; line-dasharray: 2,1.5;}
  [zoom >= 15] {
      line-width: 1.2;
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

#aawt[zoom >= 10] {
//  line-width:1;
//  line-color:#168;
  
  line-color:hsla(100,80%,40%,80%);
  line-width:3;
  line-dasharray:1,0;
  //line-smooth:0.5;
  image-filters:agg-stack-blur(2,2);
}
