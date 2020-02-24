<?xml version="1.0" encoding="UTF-8"?>
<tileset name="newchar02-2" tilewidth="32" tileheight="32" tilecount="12" columns="3">
 <image source="newchar02-2.png" width="96" height="128"/>
 <tile id="0">
  <properties>
   <property name="direction" value="down"/>
   <property name="speed" type="float" value="0.001"/>
  </properties>
  <animation>
   <frame tileid="1" duration="100"/>
   <frame tileid="0" duration="100"/>
   <frame tileid="1" duration="100"/>
   <frame tileid="2" duration="100"/>
  </animation>
 </tile>
 <tile id="1">
  <properties>
   <property name="direction" value="down"/>
  </properties>
 </tile>
 <tile id="3">
  <properties>
   <property name="direction" value="left"/>
   <property name="speed" type="float" value="0.001"/>
  </properties>
  <animation>
   <frame tileid="4" duration="100"/>
   <frame tileid="3" duration="100"/>
   <frame tileid="4" duration="100"/>
   <frame tileid="5" duration="100"/>
  </animation>
 </tile>
 <tile id="4">
  <properties>
   <property name="direction" value="left"/>
  </properties>
 </tile>
 <tile id="6">
  <properties>
   <property name="direction" value="right"/>
   <property name="speed" type="float" value="0.001"/>
  </properties>
  <animation>
   <frame tileid="7" duration="100"/>
   <frame tileid="6" duration="100"/>
   <frame tileid="7" duration="100"/>
   <frame tileid="8" duration="100"/>
  </animation>
 </tile>
 <tile id="7">
  <properties>
   <property name="direction" value="right"/>
  </properties>
 </tile>
 <tile id="9">
  <properties>
   <property name="direction" value="up"/>
   <property name="speed" type="float" value="0.001"/>
  </properties>
  <animation>
   <frame tileid="10" duration="100"/>
   <frame tileid="9" duration="100"/>
   <frame tileid="10" duration="100"/>
   <frame tileid="11" duration="100"/>
  </animation>
 </tile>
 <tile id="10">
  <properties>
   <property name="direction" value="up"/>
  </properties>
 </tile>
</tileset>
