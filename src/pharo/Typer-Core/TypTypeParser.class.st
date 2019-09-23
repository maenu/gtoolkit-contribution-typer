Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Core-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2019-09-23T19:45:44.777674+02:00'
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
	: Type 'type' { {type} }
	| Types 'types' "","" Type 'type' { types , {type} }
	;
Type
	: UnknownType 'type' { type }
	| NilType 'type' { type }
	| VariableType 'type' { type }
	| UnionType 'type' { type }
	| FunctionType 'type' { type }
	| ParametricType 'type' { type }
	| NamedType 'type' { type }
	;
UnknownType
	: ""?"" { TypUnknownType instance }
	;
NilType
	: ""!"" { TypNilType instance }
	;
VariableType
	: ""@"" Name 'name' { TypVariableType named: name }
	;
NamedType
	: Name 'name'  { TypNamedType named: name }
	;
ParametricType
	: Name 'name' ""<"" Types 'parameters' "">""  { TypParametricType new name: name; parameters: parameters; yourself }
	;
FunctionType
	: Name 'name' ""["" EmptyTypes 'parameters' ""]"" ""->"" Type 'result' { TypFunctionType new name: name; parameters: parameters; result: result; optionalParameters: true; yourself }
	| Name 'name' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new name: name; parameters: parameters; result: result; optionalParameters: false; yourself }
	;
UnionType
	: ""{"" Types 'types' ""}"" {  TypUnionType types: types  }
	;
EmptyTypes
	: Types 'types' { types }
	| { {} }
	;
Name
	: <name> 'name' { name value }
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
	#(19 1 #reduceActionForNilType1: 609281 false ) 
	#(18 1 #reduceActionForUnknownType1: 558081 false ) 
	#(26 1 #reduceActionForName1: 1419265 false ) 
	#(16 1 #reduceActionForTypes1: 241665 false ) 
	#(17 1 #liftFirstValue: 330753 false ) 
	#(17 1 #liftFirstValue: 330754 false ) 
	#(17 1 #liftFirstValue: 330755 false ) 
	#(17 1 #liftFirstValue: 330759 false ) 
	#(17 1 #liftFirstValue: 330758 false ) 
	#(17 1 #liftFirstValue: 330757 false ) 
	#(17 1 #liftFirstValue: 330756 false ) 
	#(21 1 #reduceActionForNamedType1: 720897 false ) 
	#(20 2 #reduceActionForVariableType1: 652289 false ) 
	#(25 0 #reduceActionForEmptyTypes2: 1367042 false ) 
	#(24 3 #reduceActionForUnionType1: 1295361 false ) 
	#(16 3 #reduceActionForTypes2: 241666 false ) 
	#(25 1 #liftFirstValue: 1367041 false ) 
	#(22 4 #reduceActionForParametricType1: 780289 false ) 
	#(23 6 #reduceActionForFunctionType2: 915458 false ) 
	#(23 6 #reduceActionForFunctionType1: 915457 false )
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
	^ #('"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"@"' '"["' '"]"' '"{"' '"}"' '<name>' 'B e g i n' 'Types' 'Type' 'UnknownType' 'NilType' 'VariableType' 'NamedType' 'ParametricType' 'FunctionType' 'UnionType' 'EmptyTypes' 'Name' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 29 0 16 0 33 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 65 0 26] 
#[0 0 6 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 10 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 25 0 14 0 69 0 26] 
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 73 0 16 0 33 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 65 0 26] 
#[0 0 14 0 2 0 3 0 4 0 6 0 7 0 10 0 11 0 13 0 27] 
#[1 0 77 0 4 0 0 0 27] 
#[0 0 18 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 22 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 30 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 34 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 38 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 42 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 46 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 81 0 2 0 50 0 3 0 50 0 4 0 85 0 6 0 50 0 7 0 89 0 10 0 50 0 11 0 50 0 13 0 50 0 27] 
#[0 0 54 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 77 0 4 0 93 0 13] 
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 97 0 17 0 97 0 18 0 97 0 19 0 97 0 20 0 97 0 21 0 97 0 22 0 97 0 23 0 97 0 24 0 65 0 26] 
#[1 0 9 0 1 0 58 0 3 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 101 0 16 0 33 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 105 0 25 0 65 0 26] 
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 109 0 16 0 33 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 65 0 26] 
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 58 0 11 0 21 0 12 0 25 0 14 0 101 0 16 0 33 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 113 0 25 0 65 0 26] 
#[0 0 62 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 66 0 3 0 4 0 7 0 11 0 13 0 27] 
#[1 0 70 0 3 0 77 0 4 0 70 0 11] 
#[0 0 117 0 3] 
#[1 0 77 0 4 0 121 0 7] 
#[0 0 125 0 11] 
#[0 0 129 0 5] 
#[0 0 74 0 3 0 4 0 7 0 11 0 13 0 27] 
#[0 0 133 0 5] 
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 137 0 17 0 137 0 18 0 137 0 19 0 137 0 20 0 137 0 21 0 137 0 22 0 137 0 23 0 137 0 24 0 65 0 26] 
#[1 0 9 0 1 0 13 0 8 0 17 0 9 0 21 0 12 0 25 0 14 0 141 0 17 0 141 0 18 0 141 0 19 0 141 0 20 0 141 0 21 0 141 0 22 0 141 0 23 0 141 0 24 0 65 0 26] 
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
	^ TypFunctionType new
		name: (nodes at: 1);
		parameters: (nodes at: 3);
		result: (nodes at: 6);
		optionalParameters: true;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType2: nodes [
	^ TypFunctionType new
		name: (nodes at: 1);
		parameters: (nodes at: 3);
		result: (nodes at: 6);
		optionalParameters: false;
		yourself
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
	^ TypParametricType new
		name: (nodes at: 1);
		parameters: (nodes at: 3);
		yourself
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

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForVariableType1: nodes [
	^ TypVariableType named: (nodes at: 2)
]
