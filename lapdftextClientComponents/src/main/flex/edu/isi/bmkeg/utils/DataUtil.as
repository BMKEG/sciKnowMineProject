// $Id: DataUtil.as 2057 2011-03-30 01:12:31Z tom $
package edu.isi.bmkeg.utils
{
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	/**  Collection of utility routines for working with Data in
	 *   various formats such as XML.
	 * 
	 * @author University of Southern California
	 * @date $Date: 2011-03-29 18:12:31 -0700 (Tue, 29 Mar 2011) $
	 * @version $Revision: 2057 $
	 * 
	 */
	 public class DataUtil
	{
		/** Update the attribute on all tags of the given type in
		 *  this XML structure to have the new value.  The new value
		 *  is based on a mapping hash from the old to the new values.
		 *  The update occurs in place.
		 * 
		 * @param xml The XML object to update.
		 * @param elementName The XML tag element name to update, may be "*"
		 * @param attributeName The XML attribute on the element to update.
		 * @param map The hash mapping old to new values
		 */
		public static function updateXmlTagAttributes(xml:XML,
													  elementName:String,
												      attributeName:String,
												      map:Object):void {
			for each (var element:XML in xml.descendants(elementName)) {
       			var newValue:String = map[element.@[attributeName]];
        		if (newValue) {
        			// trace(elementName + ".@" + attributeName, element.attribute(attributeName), "  ==>  ", newValue);
         			element.@[attributeName]= newValue;
        		}
        	}
		}
        	
        /** Sorts an array collection alphabetically.  Modifies
		 *  its input and also returns it.
		 * 
		 *  @param collection The Array collection to sort.  Modified.
		 *  @param fieldName The field on which to sort
		 *  @param descending Whether to sort descending. Default false.
		 *  @return The original collection argument, sorted.
		 */
		 public static function sortCollectionAlphabetically(collection:ArrayCollection,
		 													 fieldName:String,
		 													 descending:Boolean=false):ArrayCollection {
		 	var sort:Sort = new Sort();
			sort.fields = [new SortField(fieldName, true, descending)];
			collection.sort = sort;
			collection.refresh();
			return collection;	 	
		 }
		 
		 
		/** Follows a chain of fieldNames separated by "." characters.
		 *
		 * @param obj The object to operate on
		 * @param fieldName The fieldname to use for access
		 * @return The end value from following the chain
		 */
		public static function getNestedValue(obj:*, fieldName:String):* {
			var dotIndex:int = fieldName.indexOf(".");
			if (obj == null || obj == undefined) {
				return obj;
			} else if (dotIndex == -1) {
				return obj[fieldName];
			} else {
				var first:String = fieldName.substring(0,dotIndex);
				var rest:String  = fieldName.substring(dotIndex+1);
				return getNestedValue(obj[first], rest);
			}
		}
		
		/** Follows a chain of fieldNames separated by "." characters
		 *  and set the value in the last one of them.
		 *
		 * @param obj The object to operate on
		 * @param fieldName The fieldname to use for access
		 * @param value The value set at the end of the field chain.
		 */
		public static function setNestedValue(obj:*, fieldName:String, value:*):void {
			var dotIndex:int = fieldName.indexOf(".");
			if (obj == null || obj == undefined) {
				return;
			} else if (dotIndex == -1) {
				obj[fieldName] = value;
			} else {
				var first:String = fieldName.substring(0,dotIndex);
				var rest:String  = fieldName.substring(dotIndex+1);
				if (obj[first] == null) {
					obj[first] = new Object();
				}
				setNestedValue(obj[first], rest, value);
			}
		}
	}
}