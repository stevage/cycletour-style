.90m-hs[zoom <= 16],
.20m-hs[zoom >=11][zoom <= 16],
{
//  [zoom=11] { raster-opacity: 0.2; }
  [zoom<=8] { raster-opacity: 0.25; }
  [zoom=9] { raster-opacity: 0.18; }
  [zoom=10] { raster-opacity: 0.18; }
  [zoom=11] { raster-opacity: 0.14; }
  [zoom=12]  { raster-opacity:0.16;}
  [zoom=13] { raster-opacity: 0.18; }//.125
  [zoom=14] { raster-opacity: 0.16; }//.125
  [zoom=15] { raster-opacity: 0.15; }//.1
  [zoom>=16] { raster-opacity: 0.1; }//none


//  [zoom<=11][zoom >=10] { raster-opacity: 0.25; } // since no slope shading
//  raster-scaling:bilinear;
  raster-scaling:bilinear;
  raster-comp-op:multiply;
}

/* For regions with high-res terrain, we first obliterate the
low-res terrain, so we can use different opacity levels against the
same background. */
.extent[zoom >=11] {
  polygon-fill: @background;
}


/*
// currently not used
.slope[zoom <= 14][zoom >= 10] {
  raster-opacity:0.10;
  [zoom=14] { raster-opacity:0.05; }
  [zoom=13] { raster-opacity:0.05; }
  
  //  [zoom<=11] { raster-opacity: 0.2; }
  raster-scaling:lanczos;
  raster-colorizer-default-mode: linear;
  raster-colorizer-default-color: transparent;
  raster-colorizer-stops:
    stop(0, white)
    stop(25, white)
    stop(80, hsl(260,50%,30%));  
}
*/
// colour-graded elevation model
.dem {
  [zoom >= 10] { raster-opacity: 0.2; }
  [zoom = 9] { raster-opacity: 0.225; }
  [zoom = 8] { raster-opacity: 0.25; }
  [zoom <= 7] { raster-opacity: 0.3; }
  raster-scaling:bilinear;
//  raster-scaling:fast;
  raster-colorizer-default-mode: linear;
  raster-colorizer-default-color: hsl(60,50%,80%);//transparent;
/*  raster-colorizer-stops:
  stop(-50,hsl(60,50%,80%))
  stop(40,hsl(100,30%,30%))
  stop(130,hsl(100,60%,70%)) // ish?
  stop(170,white)*/
   // hay, forest, rocks, snow
/*  raster-colorizer-stops:
  stop(0,hsl(60,50%,80%))
  stop(50,hsl(110,80%,20%))
  stop(100,hsl(120,70%,20%))
  stop(140,hsl(100,0%,50%))
  stop(175,white);*/
  raster-colorizer-stops:
  stop(0,hsl(40,50%,80%))
  stop(392,hsl(110,80%,20%))
  stop(785,hsl(120,70%,20%))
  stop(1100,hsl(100,0%,50%))
  stop(1370,white);
}


.contour[zoom >=13] {
  line-smooth:1.0;
  line-width:0.5;
  line-color:hsla(100,30%,50%,15%); 
  [elev =~ ".*00"] { line-color:hsla(100,30%,45%,50%); }
  [zoom >= 14] {
    line-width:0.75;
    line-color:hsla(100,30%,50%,20%);
  }
}
.contour[zoom >= 16]::label,
.contour[zoom >= 13][elev =~ ".*00"]::label {
    text-face-name:'Roboto Condensed Light';
    text-size:10;
    text-spacing:200;
    
    text-name:'[elev]';   
    [elev =~ "100"] {  text-name:'"1oo"'; }
    [elev =~ "200"] {  text-name:'"2oo"'; }
    [elev =~ "300"] {  text-name:'"3oo"'; }
    [elev =~ "400"] {  text-name:'"4oo"'; }
    [elev =~ "500"] {  text-name:'"5oo"'; }
    [elev =~ "600"] {  text-name:'"6oo"'; }
    [elev =~ "700"] {  text-name:'"7oo"'; }
    [elev =~ "800"] {  text-name:'"8oo"'; }
    [elev =~ "900"] {  text-name:'"9oo"'; }
    [elev =~ "1000"] {  text-name:'"10oo"'; }
    [elev =~ "1100"] {  text-name:'"11oo"'; }
    [elev =~ "1200"] {  text-name:'"12oo"'; }
    [elev =~ "1300"] {  text-name:'"13oo"'; }
    [elev =~ "1400"] {  text-name:'"14oo"'; }
    [elev =~ "1500"] {  text-name:'"15oo"'; }
    [zoom >= 16][elev =~ ".*00"] { 
      text-size: 12; 
      text-spacing: 400;
      text-face-name:'Roboto Condensed Regular';
    }
    text-fill:gray;
    text-placement:line;
}

