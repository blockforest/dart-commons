/*

Copyright (2013 as c), Jean-Philippe Côté (jp@cote.cc)
All rights reserved.

This library can be used freely for non-profit purposes. For-profit usage requires written 
approval or a donation (see http://cote.cc/projects/softkeyboard). The donation amount is set to 
whatever the user deems fair.

Even though this library is open source, it cannot be redistributed or modified without prior 
consent from its author. Comments and suggestions are always encouraged.

This library is provided "as is" with no guarantees whatsoever. Use it at your own risk.

*/

 part of stagexl_commons;
	
	/**
	 * The <code>numsSymbolsSwitch</code> class defines a keyboard layout containing all 10 
	 * digits and the most useful symbol characters (including many key variants). It also features
	 * a <code>SWITCH_LAYOUT</code> key.
	 */
	 class numsSymbolsSwitch extends Layout
	{
		
		
		/** 
		 * Creates a new numsSymbolsSwitch object.
		 * 
		 * @param switchKeyLayout The class to use with the <code>SWITCH_KEY</code> defined by this
		 * layout.
		 */
		  void numsSymbolsSwitch(Layout switchKeyType) {
				/** The label to use on <code>SWITCH_LAYOUT</code> keys pointing to this layout. */
  		 _switchKeyLabel = r'123 @$?';
			
			// Define all rows of keys for that layout
			rows = [
				[
					new Key(CharCode.DIGIT_1),
					new Key(CharCode.DIGIT_2),
					new Key(CharCode.DIGIT_3),
					new Key(CharCode.DIGIT_4),
					new Key(CharCode.DIGIT_5),
					new Key(CharCode.DIGIT_6),
					new Key(CharCode.DIGIT_7),
					new Key(CharCode.DIGIT_8),
					new Key(CharCode.DIGIT_9),
					new Key(CharCode.DIGIT_0)
				],
				[
					new Key(CharCode.HYPHEN, SymbolKeyVariants.MINUS),
					new Key(CharCode.SLASH, SymbolKeyVariants.SLASH),
					new Key(CharCode.COLON, SymbolKeyVariants.COLON),
					new Key(CharCode.TILDE),
					new Key(CharCode.LEFT_PARENTHESIS, SymbolKeyVariants.LEFT_PARENTHESIS), 
					new Key(CharCode.RIGHT_PARENTHESIS, SymbolKeyVariants.RIGHT_PARENTHESIS),
					new Key(CharCode.DOLLAR, SymbolKeyVariants.DOLLAR_SIGN),
					new Key(CharCode.AMPERSAND),
					new Key(CharCode.APOSTROPHE),
					new Key(CharCode.QUOTE)
				],
				[
					new Key(CharCode.AT_SIGN, SymbolKeyVariants.AT_SIGN),
					new Key(CharCode.PERIOD),
					new Key(CharCode.COMMA),
					new Key(CharCode.QUESTION_MARK, SymbolKeyVariants.QUESTION_MARK),
					new Key(CharCode.EXCLAMATION_MARK, SymbolKeyVariants.EXCLAMATION_MARK),
					new Key(CharCode.HASH),
					new Key(CharCode.CIRCUMFLEX_ACCENT),
					new Key(CharCode.BACKTICK),
					new Key(CharCode.PERCENT, SymbolKeyVariants.PERCENT),
					new Key(CharCode.ASTERISK,  SymbolKeyVariants.ASTERISK),
					new Key(CharCode.BACKSPACE, null, Key.EDITING_KEY, 'BACKSPACE', 1.55)
				],
				[
					new Key(CharCode.SWITCH_LAYOUT, null, Key.SYSTEM_KEY, switchKeyType.SWITCH_KEY_LABEL, 2.5, 1, switchKeyType),
					new Key(CharCode.SPACE, null, Key.CHARACTER_KEY, '', 5),
					new Key(CharCode.RETURN, null, Key.EDITING_KEY, 'RETURN', 2.5)
				]
			];
			
		}					
		
	}
	
