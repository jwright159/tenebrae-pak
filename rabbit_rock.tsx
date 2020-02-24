<?xml version="1.0" encoding="UTF-8"?>
<tileset name="rabbit_rock" tilewidth="32" tileheight="32" tilecount="2" columns="2">
 <image source="rabbit_rock.png" width="64" height="32"/>
 <tile id="0">
  <objectgroup draworder="index">
   <object id="2" x="0" y="0" width="32" height="32">
    <properties>
     <property name="onTrigger">talk</property>
    </properties>
   </object>
  </objectgroup>
 </tile>
 <tile id="1">
  <properties>
   <property name="direction" value="up down left right"/>
  </properties>
  <objectgroup draworder="index">
   <object id="1" x="0" y="0" width="32" height="32">
    <properties>
     <property name="onTrigger">talk</property>
    </properties>
   </object>
  </objectgroup>
  <animation>
   <frame tileid="0" duration="100"/>
   <frame tileid="1" duration="100"/>
  </animation>
 </tile>
</tileset>
