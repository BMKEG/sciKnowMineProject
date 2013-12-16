package edu.isi.bmkeg.utils
{
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	 public class SimpleUtils
	{
	
		public static function stripPathToName(s:String):String {
			if( s != null ) {
				var i:int = s.lastIndexOf("/");
				s = s.substr(i+1,s.length);	
			}
			return s;
		}
		
	}
}