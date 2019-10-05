Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Core-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2019-10-05T20:11:07.940457+02:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;
%start Types;

<identifier>
	: [A-Za-z0-9_]+
	;
<selector>
	: [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,]+
	| (<identifier> :)+
	| <identifier>
	;
<name>
	: <identifier> [ ] classTrait
	| <identifier> [ ] class
	| <identifier>
	;

Types
	: Type 'type'
		{ {type} }
	| Types 'types' "","" Type 'type'
		{ types , {type} }
	;
Type
	: UnknownType 'type'
		{ type }
	| NilType 'type'
		{ type }
	| TypeVariableType 'type'
		{ type }
	| UnionType 'type'
		{ type }
	| FunctionType 'type'
		{ type }
	| ParametricType 'type' 
		{ type }
	| NamedType 'type'
		{ type }
	;
UnknownType
	: ""?""
		{ TypUnknownType instance }
	;
NilType
	: ""!""
		{ TypNilType instance }
	;
TypeVariableType
	: ""@"" Name 'name'
		{ TypTypeVariableType named: '@' , name }
	;
NamedType
	: Name 'name' 
		{ TypNamedType named: name }
	;
ParametricType
	: Name 'name' ""<"" Types 'parameters' "">"" 
		{ | type |
		type := name typAsType.
		type copyWithBindings: (parameters withIndexCollect: [ :e :i | | parameter |
			parameter := type parameters at: i.
			parameter -> e ]) typAsTypeVariableBindings }
	;
FunctionType
	: ""["" EmptyTypes 'arguments' ""]"" ""->"" Type 'result'
		{ | bindings |
		bindings := ((arguments , { result } select: #isTypeVariable) asSet collect: [ :e | e -> e ]) typAsTypeVariableBindings.
		TypFunctionType arguments: arguments result: result optionalArguments: true bindings:  bindings }
	| ""("" EmptyTypes 'arguments' "")"" ""->"" Type 'result'
		{ | bindings |
		bindings := ((arguments , { result } select: #isTypeVariable) asSet collect: [ :e | e -> e ]) typAsTypeVariableBindings.
		TypFunctionType arguments: arguments result: result optionalArguments: false bindings:  bindings }
	;
UnionType
	: ""{"" Types 'types' ""}""
		{  TypUnionType types: types  }
	;
EmptyTypes
	: Types 'types'
		{ types }
	| { {} }
	;
Name
	: <name> 'name'
		{ name value }
	;"
]

{ #category : #accessing }
TypTypeParser class >> parse: aString [
	<typTypeArgument: 1 as: 'String<Character>'>
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ super parse: aString
]

{ #category : #generated }
TypTypeParser class >> reduceTable [
^#(
	#(19 1 #reduceActionForNilType1: 634881 false ) 
	#(25 0 #reduceActionForEmptyTypes2: 1790978 false ) 
	#(18 1 #reduceActionForUnknownType1: 581633 false ) 
	#(26 1 #reduceActionForName1: 1845249 false ) 
	#(16 1 #reduceActionForTypes1: 241665 false ) 
	#(17 1 #liftFirstValue: 334849 false ) 
	#(17 1 #liftFirstValue: 334850 false ) 
	#(17 1 #liftFirstValue: 334851 false ) 
	#(17 1 #liftFirstValue: 334855 false ) 
	#(17 1 #liftFirstValue: 334854 false ) 
	#(17 1 #liftFirstValue: 334853 false ) 
	#(17 1 #liftFirstValue: 334852 false ) 
	#(21 1 #reduceActionForNamedType1: 764929 false ) 
	#(25 1 #liftFirstValue: 1790977 false ) 
	#(20 2 #reduceActionForTypeVariableType1: 679937 false ) 
	#(24 3 #reduceActionForUnionType1: 1717249 false ) 
	#(16 3 #reduceActionForTypes2: 241666 false ) 
	#(22 4 #reduceActionForParametricType1: 826369 false ) 
	#(23 5 #reduceActionForFunctionType2: 1099778 false ) 
	#(23 5 #reduceActionForFunctionType1: 1099777 false )
	).
]

{ #category : #'generated-accessing' }
TypTypeParser class >> scannerClass [
	^TypTypeScanner
]

{ #category : #generated }
TypTypeParser class >> startingStateForTypes [
	^ 1
]

{ #category : #generated }
TypTypeParser class >> symbolNames [
	^ #('"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"@"' '"["' '"]"' '"{"' '"}"' '<name>' 'B e g i n' 'Types' 'Type' 'UnknownType' 'NilType' 'TypeVariableType' 'NamedType' 'ParametricType' 'FunctionType' 'UnionType' 'EmptyTypes' 'Name' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 37 0 16 0 41 0 17 0 41 0 18 0 41 0 19 0 41 0 20 0 41 0 21 0 41 0 22 0 41 0 23 0 41 0 24 0 73 0 26] 
#[0 0 6 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 9 0 1 0 13 0 2 0 10 0 3 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 77 0 16 0 41 0 17 0 41 0 18 0 41 0 19 0 41 0 20 0 41 0 21 0 41 0 22 0 41 0 23 0 41 0 24 0 81 0 25 0 73 0 26] 
#[0 0 14 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 33 0 14 0 85 0 26] 
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 10 0 11 0 29 0 12 0 33 0 14 0 77 0 16 0 41 0 17 0 41 0 18 0 41 0 19 0 41 0 20 0 41 0 21 0 41 0 22 0 41 0 23 0 41 0 24 0 89 0 25 0 73 0 26] 
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 93 0 16 0 41 0 17 0 41 0 18 0 41 0 19 0 41 0 20 0 41 0 21 0 41 0 22 0 41 0 23 0 41 0 24 0 73 0 26] 
#[0 0 18 0 3 0 4 0 6 0 7 0 11 0 13 0 27] 
#[1 0 97 0 4 0 0 0 27] 
#[0 0 22 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 30 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 34 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 38 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 42 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 46 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 50 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 54 0 3 0 54 0 4 0 101 0 6 0 54 0 7 0 54 0 11 0 54 0 13 0 54 0 27] 
#[1 0 58 0 3 0 97 0 4 0 58 0 11] 
#[0 0 105 0 3] 
#[0 0 62 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 109 0 11] 
#[1 0 97 0 4 0 113 0 13] 
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 117 0 17 0 117 0 18 0 117 0 19 0 117 0 20 0 117 0 21 0 117 0 22 0 117 0 23 0 117 0 24 0 73 0 26] 
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 121 0 16 0 41 0 17 0 41 0 18 0 41 0 19 0 41 0 20 0 41 0 21 0 41 0 22 0 41 0 23 0 41 0 24 0 73 0 26] 
#[0 0 125 0 5] 
#[0 0 129 0 5] 
#[0 0 66 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 70 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 97 0 4 0 133 0 7] 
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 137 0 17 0 137 0 18 0 137 0 19 0 137 0 20 0 137 0 21 0 137 0 22 0 137 0 23 0 137 0 24 0 73 0 26] 
#[1 0 9 0 1 0 13 0 2 0 17 0 8 0 21 0 9 0 25 0 10 0 29 0 12 0 33 0 14 0 141 0 17 0 141 0 18 0 141 0 19 0 141 0 20 0 141 0 21 0 141 0 22 0 141 0 23 0 141 0 24 0 73 0 26] 
#[0 0 74 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 78 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 82 0 3 0 4 0 7 0 11 0 13 0 27]
	).
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForEmptyTypes2: nodes [
	^ {}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType1: nodes [
	| bindings |
	bindings := (((nodes at: 2) , {(nodes at: 5)} select: #isTypeVariable)
		asSet collect: [ :e | e -> e ]) typAsTypeVariableBindings.
	^ TypFunctionType
		arguments: (nodes at: 2)
		result: (nodes at: 5)
		optionalArguments: true
		bindings: bindings
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType2: nodes [
	| bindings |
	bindings := (((nodes at: 2) , {(nodes at: 5)} select: #isTypeVariable)
		asSet collect: [ :e | e -> e ]) typAsTypeVariableBindings.
	^ TypFunctionType
		arguments: (nodes at: 2)
		result: (nodes at: 5)
		optionalArguments: false
		bindings: bindings
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForName1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNamedType1: nodes [
	^ TypNamedType named: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNilType1: nodes [
	^ TypNilType instance
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForParametricType1: nodes [
	| type |
	type := (nodes at: 1) typAsType.
	^ type
		copyWithBindings:
			((nodes at: 3)
				withIndexCollect: [ :e :i | 
					| parameter |
					parameter := type parameters at: i.
					parameter -> e ]) typAsTypeVariableBindings
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypeVariableType1: nodes [
	^ TypTypeVariableType named: '@' , (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes1: nodes [
	^ {(nodes at: 1)}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes2: nodes [
	^ (nodes at: 1) , {(nodes at: 3)}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnionType1: nodes [
	^ TypUnionType types: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnknownType1: nodes [
	^ TypUnknownType instance
]
