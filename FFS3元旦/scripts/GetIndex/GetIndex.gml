var Name =   argument0
var Asset = argument1

var Index = asset_get_index(Name)
if asset_get_type(Name) == Asset
return Index
else
//排错机制
switch (Asset) {
    case asset_sprite:
     return sNoSP
        break;
	 case asset_object:
       return oObject
        break;

}