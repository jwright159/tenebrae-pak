<?xml version="1.0" encoding="UTF-8"?>
<tileset name="Plant 2" tilewidth="32" tileheight="32" tilecount="1" columns="1">
 <image source="plant2.png" width="32" height="32"/>
 <tile id="0">
  <properties>
   <property name="direction" value="up down left right"/>
  </properties>
  <objectgroup draworder="index">
   <object id="1" x="0" y="0" width="32" height="32">
    <properties>
     <property name="onEnter" value="enter"/>
     <property name="onExit" value="exit"/>
     <property name="onTrigger" value="trigger"/>
    </properties>
   </object>
  </objectgroup>
 </tile>
</tileset>
