<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=7, IE=9, IE=10">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no"/>
    <title>ArcGIS API for JavaScript | Simple Geocoding</title>
    <link rel="stylesheet" href="http://serverapi.arcgisonline.com/jsapi/arcgis/3.4/js/esri/css/esri.css">
    <style>
      html, body, #map {
        height:100%;
        width:100%;
        margin:0;
        padding:0;
      }
      #search {
        display: block;
        position: absolute;
        z-index: 2;
        top: 20px;
        left: 74px;
      }
    </style>
    <script src="http://serverapi.arcgisonline.com/jsapi/arcgis/3.3"></script>
    <script>
      dojo.require("esri.map");
      dojo.require("esri.dijit.Geocoder");

      var map, geocoder;

      dojo.ready(function() {
        // create the map
        map = new esri.Map("map",{
          basemap: "gray",
          center: [-120.435, 46.159], // long, lat
          zoom: 7 
        });

        // create the geocoder
        geocoder = new esri.dijit.Geocoder({ 
          map: map 
        }, "search");
        geocoder.startup();
      });
    </script>
  </head>
  <body>
    <div id="search"></div>
    <div id="map"></div>
  </body>
</html>