function weighted_choose(){
	/// @description weighted_choose( [num, weight], num, [num, weight], ...);
	/// @param [num
	/// @param weight]
	/// @param num
	/// @param ...

	var args = ds_list_create();
	var points = 0;

	for( var i = 0; i < argument_count; ++i){
	    if( is_array( argument[i])){
	        ds_list_add( args, argument[i]);
	    }else{
	        ds_list_add( args, [argument[i], 1]);
	    }
	}

	for( var i = 0; i < argument_count; ++i){
	    var me = ds_list_find_value( args, i);
	    points += me[1];
	}

	var chosenPoint = irandom( points - 1);
	var locator = 0;

	for( var i = 0; i < argument_count; ++i){
	    var me = ds_list_find_value( args, i);
	    locator += me[1];
	    if( locator > chosenPoint){
	        return me[0];
	    }
	}
}