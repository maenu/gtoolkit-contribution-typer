Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-25T21:23:36.170691+01:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;

<name>
	: [A-Za-z0-9_]+
	| \?
	;

Types
	: Type 'type' { {type} }
	| Types 'types' "","" Type 'type' { types , {type} }
	;
Type
	: UnionType 'type' { type }
	| FunctionType 'type' { type }
	| ParametricType 'type' { type }
	| NamedType 'type' { type }
	| UnknownType 'type' { type }
	| NilType 'type' { type }
	;
NilType
	: ""!"" {  TypNilType instance  }
	;
UnknownType
	: ""?"" {  TypUnknownType instance  }
	;
NamedType
	: Nullable 'nullable' Name 'name'  { TypNamedType new nullable: nullable; name: name; yourself }
	;
ParametricType
	: NamedType 'type' ""<"" Types 'parameters' "">""  { type asParametricType: parameters }
	;
FunctionType
	: NamedType 'type' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new type: type; parameters: parameters; result: result; optionalParameters: false; yourself }
	| NamedType 'type' ""["" EmptyTypes 'parameters' ""]"" ""->"" Type 'result' { TypFunctionType new type: type; parameters: parameters; result: result; optionalParameters: true; yourself }
	;
UnionType
	: ""{"" Types 'types' ""}"" {  TypUnionType new types: types asSet; yourself  }
	;
EmptyTypes
	: Types 'types' { types }
	| { {} }
	;
Nullable
	:""!"" { true }
	| { false }
	;
Name
	: <name> 'name' "" class"" { (name value , ' class') asSymbol }
	| <name> 'name' { name value asSymbol }
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
	#(25 0 #reduceActionForNullable2:) 
	#(18 1 #reduceActionForNilType1:) 
	#(25 1 #reduceActionForNullable1:) 
	#(19 1 #reduceActionForUnknownType1:) 
	#(16 1 #reduceActionForTypes1:) 
	#(17 1 #liftFirstValue:) 
	#(24 0 #reduceActionForEmptyTypes2:) 
	#(26 1 #reduceActionForName2:) 
	#(20 2 #reduceActionForNamedType1:) 
	#(23 3 #reduceActionForUnionType1:) 
	#(16 3 #reduceActionForTypes2:) 
	#(24 1 #liftFirstValue:) 
	#(26 2 #reduceActionForName1:) 
	#(21 4 #reduceActionForParametricType1:) 
	#(22 6 #reduceActionForFunctionType1:) 
	#(22 6 #reduceActionForFunctionType2:)
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
	^ #('" class"' '"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"["' '"]"' '"{"' '"}"' '<name>' 'B e g i n' 'Types' 'Type' 'NilType' 'UnknownType' 'NamedType' 'ParametricType' 'FunctionType' 'UnionType' 'EmptyTypes' 'Nullable' 'Name' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 14 0 21 0 16 0 25 0 17 0 25 0 18 0 25 0 19 0 37 0 20 0 25 0 21 0 25 0 22 0 25 0 23 0 53 0 25] 
#[1 0 10 0 4 0 10 0 5 0 10 0 8 0 10 0 11 0 10 0 13 0 14 0 14 0 10 0 27] 
#[0 0 18 0 4 0 5 0 8 0 11 0 13 0 27] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 14 0 57 0 16 0 25 0 17 0 25 0 18 0 25 0 19 0 37 0 20 0 25 0 21 0 25 0 22 0 25 0 23 0 53 0 25] 
#[1 0 61 0 5 0 0 0 27] 
#[0 0 22 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 26 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 26 0 4 0 5 0 8 0 11 0 13 0 27] 
#[1 0 65 0 3 0 26 0 4 0 26 0 5 0 69 0 7 0 26 0 8 0 73 0 10 0 26 0 11 0 26 0 13 0 26 0 27] 
#[0 0 26 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 26 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 26 0 4 0 5 0 8 0 11 0 13 0 27] 
#[1 0 77 0 14 0 81 0 26] 
#[1 0 61 0 5 0 85 0 13] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 14 0 89 0 17 0 89 0 18 0 89 0 19 0 37 0 20 0 89 0 21 0 89 0 22 0 89 0 23 0 53 0 25] 
#[1 0 9 0 2 0 30 0 4 0 13 0 9 0 17 0 12 0 6 0 14 0 93 0 16 0 25 0 17 0 25 0 18 0 25 0 19 0 37 0 20 0 25 0 21 0 25 0 22 0 25 0 23 0 97 0 24 0 53 0 25] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 14 0 101 0 16 0 25 0 17 0 25 0 18 0 25 0 19 0 37 0 20 0 25 0 21 0 25 0 22 0 25 0 23 0 53 0 25] 
#[1 0 9 0 2 0 13 0 9 0 30 0 11 0 17 0 12 0 6 0 14 0 93 0 16 0 25 0 17 0 25 0 18 0 25 0 19 0 37 0 20 0 25 0 21 0 25 0 22 0 25 0 23 0 105 0 24 0 53 0 25] 
#[1 0 109 0 1 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 11 0 34 0 13 0 34 0 27] 
#[0 0 38 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 13 0 27] 
#[0 0 42 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 46 0 4 0 5 0 8 0 11 0 13 0 27] 
#[1 0 50 0 4 0 61 0 5 0 50 0 11] 
#[0 0 113 0 4] 
#[1 0 61 0 5 0 117 0 8] 
#[0 0 121 0 11] 
#[0 0 54 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 13 0 27] 
#[0 0 125 0 6] 
#[0 0 58 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 129 0 6] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 14 0 133 0 17 0 133 0 18 0 133 0 19 0 37 0 20 0 133 0 21 0 133 0 22 0 133 0 23 0 53 0 25] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 14 0 137 0 17 0 137 0 18 0 137 0 19 0 37 0 20 0 137 0 21 0 137 0 22 0 137 0 23 0 53 0 25] 
#[0 0 62 0 4 0 5 0 8 0 11 0 13 0 27] 
#[0 0 66 0 4 0 5 0 8 0 11 0 13 0 27]
	).
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForEmptyTypes2: nodes [
	^ {}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType1: nodes [
	^ TypFunctionType new
		type: (nodes at: 1);
		parameters: (nodes at: 3);
		result: (nodes at: 6);
		optionalParameters: false;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType2: nodes [
	^ TypFunctionType new
		type: (nodes at: 1);
		parameters: (nodes at: 3);
		result: (nodes at: 6);
		optionalParameters: true;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForName1: nodes [
	^ ((nodes at: 1) value , ' class') asSymbol
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForName2: nodes [
	^ (nodes at: 1) value asSymbol
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNamedType1: nodes [
	^ TypNamedType new
		nullable: (nodes at: 1);
		name: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNilType1: nodes [
	^ TypNilType instance
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNullable1: nodes [
	^ true
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNullable2: nodes [
	^ false
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForParametricType1: nodes [
	^ (nodes at: 1) asParametricType: (nodes at: 3)
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
	^ TypUnionType new
		types: (nodes at: 2) asSet;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnknownType1: nodes [
	^ TypUnknownType instance
]
