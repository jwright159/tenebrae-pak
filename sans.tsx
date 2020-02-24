<?xml version="1.0" encoding="UTF-8"?>
<tileset name="sans" tilewidth="32" tileheight="32" tilecount="9" columns="3">
 <image source="sans.png" width="96" height="96"/>
 <tile id="0">
  <properties>
   <property name="direction" value="down"/>
  </properties>
  <animation>
   <frame tileid="1" duration="100"/>
   <frame tileid="0" duration="100"/>
   <frame tileid="1" duration="100"/>
   <frame tileid="2" duration="100"/>
  </animation>
 </tile>
 <tile id="3">
  <properties>
   <property name="direction" value="left"/>
   <property name="directionFlipHori" value="right"/>
  </properties>
  <animation>
   <frame tileid="4" duration="100"/>
   <frame tileid="3" duration="100"/>
   <frame tileid="4" duration="100"/>
   <frame tileid="5" duration="100"/>
  </animation>
 </tile>
 <tile id="6">
  <properties>
   <property name="direction" value="right"/>
  </properties>
  <animation>
   <frame tileid="7" duration="100"/>
   <frame tileid="6" duration="100"/>
   <frame tileid="7" duration="100"/>
   <frame tileid="8" duration="100"/>
  </animation>
 </tile>
</tileset>
