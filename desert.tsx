<?xml version="1.0" encoding="UTF-8"?>
<tileset name="Desert" tilewidth="32" tileheight="32" spacing="0" margin="0" tilecount="56" columns="8">
 <image source="desert 3.png" width="256" height="224"/>
 <terraintypes>
  <terrain name="Desert" tile="29"/>
  <terrain name="Brick" tile="9"/>
  <terrain name="Cobblestone" tile="33"/>
  <terrain name="Dirt" tile="14"/>
 </terraintypes>
 <tile id="0" terrain="0,0,0,1">
  <objectgroup draworder="index">
   <object id="1" x="16" y="16" width="8" height="16"/>
   <object id="2" x="24" y="16" width="8" height="8"/>
  </objectgroup>
 </tile>
 <tile id="1" terrain="0,0,1,1">
  <objectgroup draworder="index">
   <object id="1" x="0" y="16" width="32" height="8"/>
  </objectgroup>
 </tile>
 <tile id="2" terrain="0,0,1,0">
  <objectgroup draworder="index">
   <object id="1" x="0" y="16" width="8" height="8"/>
   <object id="2" x="8" y="16" width="8" height="16"/>
  </objectgroup>
 </tile>
 <tile id="3" terrain="3,3,3,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="4" terrain="3,3,0,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="5" terrain="0,0,0,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="6" terrain="0,0,3,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="7" terrain="0,0,3,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="8" terrain="0,1,0,1">
  <objectgroup draworder="index">
   <object id="1" x="16" y="0" width="8" height="32"/>
  </objectgroup>
 </tile>
 <tile id="9" terrain="1,1,1,1"/>
 <tile id="10" terrain="1,0,1,0">
  <objectgroup draworder="index">
   <object id="1" x="8" y="0" width="8" height="32"/>
  </objectgroup>
 </tile>
 <tile id="11" terrain="3,0,3,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="12" terrain="0,3,3,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="13" terrain="0,3,0,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="14" terrain="3,3,3,3">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="15" terrain="3,0,3,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="16" terrain="0,1,0,0">
  <objectgroup draworder="index">
   <object id="1" x="16" y="0" width="8" height="16"/>
   <object id="2" x="24" y="8" width="8" height="8"/>
  </objectgroup>
 </tile>
 <tile id="17" terrain="1,1,0,0">
  <objectgroup draworder="index">
   <object id="1" x="0" y="8" width="32" height="8"/>
  </objectgroup>
 </tile>
 <tile id="18" terrain="1,0,0,0">
  <objectgroup draworder="index">
   <object id="1" x="8" y="0" width="8" height="16"/>
   <object id="2" x="0" y="8" width="8" height="8"/>
  </objectgroup>
 </tile>
 <tile id="19" terrain="1,1,1,0">
  <objectgroup draworder="index">
   <object id="1" x="8" y="8" width="8" height="24"/>
   <object id="2" x="16" y="8" width="16" height="8"/>
  </objectgroup>
 </tile>
 <tile id="20" terrain="1,1,0,1">
  <objectgroup draworder="index">
   <object id="1" x="16" y="8" width="8" height="24"/>
   <object id="2" x="0" y="8" width="16" height="8"/>
  </objectgroup>
 </tile>
 <tile id="21" terrain="0,3,0,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="22" terrain="3,3,0,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="23" terrain="3,0,0,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="24" terrain="0,0,0,2"/>
 <tile id="25" terrain="0,0,2,2"/>
 <tile id="26" terrain="0,0,2,0"/>
 <tile id="27" terrain="1,0,1,1">
  <objectgroup draworder="index">
   <object id="1" x="8" y="0" width="8" height="24"/>
   <object id="2" x="16" y="16" width="16" height="8"/>
  </objectgroup>
 </tile>
 <tile id="28" terrain="0,1,1,1">
  <objectgroup draworder="index">
   <object id="1" x="16" y="0" width="8" height="24"/>
   <object id="2" x="0" y="16" width="16" height="8"/>
  </objectgroup>
 </tile>
 <tile id="29" terrain="0,0,0,0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="30" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="31" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
  <objectgroup draworder="index"/>
 </tile>
 <tile id="32" terrain="0,2,0,2"/>
 <tile id="33" terrain="2,2,2,2"/>
 <tile id="34" terrain="2,0,2,0"/>
 <tile id="35" terrain="2,2,2,0"/>
 <tile id="36" terrain="2,2,0,2"/>
 <tile id="37" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="38" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="39" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="40" terrain="0,2,0,0"/>
 <tile id="41" terrain="2,2,0,0"/>
 <tile id="42" terrain="2,0,0,0"/>
 <tile id="43" terrain="2,0,2,2"/>
 <tile id="44" terrain="0,2,2,2"/>
 <tile id="45" terrain="0,0,0,0" probability="0">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="46" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
 </tile>
 <tile id="47" terrain="0,0,0,0" probability="0.01">
  <properties>
   <property name="enemies" value="1.0 Slime;"/>
  </properties>
  <objectgroup draworder="index">
   <object id="1" x="0" y="0" width="16" height="32"/>
   <object id="2" x="8" y="0" width="16" height="32"/>
  </objectgroup>
 </tile>
</tileset>
