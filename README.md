# godot modular gun system

A simple gun system i made for one of my projects in Godot.

The idea of it is to seperate the data of the gun from the functionality, so the functionality is in a spatial node
while the stats of the gun like fire rate, name and bullet speed is stored in a seperate resource. The Gun node then uses those stats in it's logic.

This makes for a system where stat resources could be swapped in the gun at runtime and multiple varying stat files for the same gun could be made to represent
different variants.

The project also contains an example scene with a constantly shooting gun.
