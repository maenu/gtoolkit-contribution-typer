Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Core-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2022-12-20T14:09:16.809882+01:00'
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
	| VariableType 'type'
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
		{ TypUnknownType new }
	;
NilType
	: ""!""
		{ TypNilType new }
	;
VariableType
	: ""#"" Name 'name'
		{ TypVariableType named: name asSymbol }
	| ""#"" Name 'name' ""<="" Type 'superType' 
		{ TypVariableType super: superType named: name asSymbol }
	;
NamedType
	: Name 'name' 
		{ [ name asClass typAsType ] on: NotFound do: [ TypNamedType named: name ] }
	;
ParametricType
	: Name 'name' ""<"" Types 'parameters' "">"" 
		{ | type |
		type := [ name asClass typAsType ] on: NotFound do: [ TypNamedType named: name ].
		type withParameters: parameters }
	;
FunctionType
	: Name 'name' ""["" EmptyTypes 'arguments' ""]"" ""->"" Type 'result'
		{ TypFunctionType named: name result: result arguments: arguments argumentsOptional: true signalsAlways: nil }
	| Name 'name' ""("" EmptyTypes 'arguments' "")"" ""->"" Type 'result'
		{ TypFunctionType named: name result: result arguments: arguments argumentsOptional: false signalsAlways: nil }
	;
UnionType
	: ""{"" Types 'types' ""}""
		{ TypUnionType types: types asIdentitySet }
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
	<typPraResult: 'SequenceableCollection<TypType>'>
	<typPraArguments: 'String'>
	^ super parse: aString	"typCastAs SequenceableCollection<TypType>"
]

{ #category : #generated }
TypTypeParser class >> reduceTable [
^#(
	#(20 1 #reduceActionForNilType1: 625665 false) 
	#(19 1 #reduceActionForUnknownType1: 577537 false) 
	#(27 1 #reduceActionForName1: 1681409 false) 
	#(17 1 #reduceActionForTypes1: 241665 false) 
	#(18 1 #liftFirstValue: 334849 false) 
	#(18 1 #liftFirstValue: 334850 false) 
	#(18 1 #liftFirstValue: 334851 false) 
	#(18 1 #liftFirstValue: 334855 false) 
	#(18 1 #liftFirstValue: 334854 false) 
	#(18 1 #liftFirstValue: 334853 false) 
	#(18 1 #liftFirstValue: 334852 false) 
	#(22 1 #reduceActionForNamedType1: 849921 false) 
	#(21 2 #reduceActionForVariableType1: 665601 false) 
	#(26 0 #reduceActionForEmptyTypes2: 1627138 false) 
	#(25 3 #reduceActionForUnionType1: 1541121 false) 
	#(17 3 #reduceActionForTypes2: 241666 false) 
	#(26 1 #liftFirstValue: 1627137 false) 
	#(21 4 #reduceActionForVariableType2: 665602 false) 
	#(23 4 #reduceActionForParametricType1: 960513 false) 
	#(24 6 #reduceActionForFunctionType2: 1159170 false) 
	#(24 6 #reduceActionForFunctionType1: 1159169 false)
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

	^ #( '"!"' '"#"' '"("' '")"' '","' '"->"' '"<"' '"<="' '">"' '"?"'
	     '"["' '"]"' '"{"' '"}"' '<name>' 'B e g i n' 'Types' 'Type'
	     'UnknownType' 'NilType' 'VariableType' 'NamedType' 'ParametricType'
	     'FunctionType' 'UnionType' 'EmptyTypes' 'Name' 'E O F' 'error' )
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 29 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 65 0 27] 
#[0 0 6 0 4 0 5 0 9 0 12 0 14 0 28] 
#[1 0 25 0 15 0 69 0 27] 
#[0 0 10 0 4 0 5 0 9 0 12 0 14 0 28] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 73 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 65 0 27] 
#[0 0 14 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 14 0 28] 
#[1 0 77 0 5 0 0 0 28] 
#[0 0 18 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 22 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 26 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 30 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 34 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 38 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 42 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 46 0 4 0 5 0 9 0 12 0 14 0 28] 
#[1 0 81 0 3 0 50 0 4 0 50 0 5 0 85 0 7 0 50 0 9 0 89 0 11 0 50 0 12 0 50 0 14 0 50 0 28] 
#[1 0 54 0 4 0 54 0 5 0 93 0 8 0 54 0 9 0 54 0 12 0 54 0 14 0 54 0 28] 
#[1 0 77 0 5 0 97 0 14] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 101 0 18 0 101 0 19 0 101 0 20 0 101 0 21 0 101 0 22 0 101 0 23 0 101 0 24 0 101 0 25 0 65 0 27] 
#[1 0 9 0 1 0 13 0 2 0 58 0 4 0 17 0 10 0 21 0 13 0 25 0 15 0 105 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 109 0 26 0 65 0 27] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 113 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 65 0 27] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 58 0 12 0 21 0 13 0 25 0 15 0 105 0 17 0 33 0 18 0 33 0 19 0 33 0 20 0 33 0 21 0 33 0 22 0 33 0 23 0 33 0 24 0 33 0 25 0 117 0 26 0 65 0 27] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 121 0 18 0 121 0 19 0 121 0 20 0 121 0 21 0 121 0 22 0 121 0 23 0 121 0 24 0 121 0 25 0 65 0 27] 
#[0 0 62 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 66 0 4 0 5 0 9 0 12 0 14 0 28] 
#[1 0 70 0 4 0 77 0 5 0 70 0 12] 
#[0 0 125 0 4] 
#[1 0 77 0 5 0 129 0 9] 
#[0 0 133 0 12] 
#[0 0 74 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 137 0 6] 
#[0 0 78 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 141 0 6] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 145 0 18 0 145 0 19 0 145 0 20 0 145 0 21 0 145 0 22 0 145 0 23 0 145 0 24 0 145 0 25 0 65 0 27] 
#[1 0 9 0 1 0 13 0 2 0 17 0 10 0 21 0 13 0 25 0 15 0 149 0 18 0 149 0 19 0 149 0 20 0 149 0 21 0 149 0 22 0 149 0 23 0 149 0 24 0 149 0 25 0 65 0 27] 
#[0 0 82 0 4 0 5 0 9 0 12 0 14 0 28] 
#[0 0 86 0 4 0 5 0 9 0 12 0 14 0 28]
	).
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForEmptyTypes2: nodes [

	^ {  }
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType1: nodes [
	^ TypFunctionType
		named: (nodes at: 1)
		result: (nodes at: 6)
		arguments: (nodes at: 3)
		argumentsOptional: true
		signalsAlways: nil
		signalsMaybe: nil
		node: nil
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType2: nodes [
	^ TypFunctionType
		named: (nodes at: 1)
		result: (nodes at: 6)
		arguments: (nodes at: 3)
		argumentsOptional: false
		signalsAlways: nil
		signalsMaybe: nil
		node: nil
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForName1: nodes [

	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNamedType1: nodes [

	^ [ (nodes at: 1) asClass typAsType ]
		  on: NotFound
		  do: [ TypNamedType named: (nodes at: 1) ]
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForNilType1: nodes [

	^ TypNilType new
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForParametricType1: nodes [

	| type |
	type := [ (nodes at: 1) asClass typAsType ]
		        on: NotFound
		        do: [ TypNamedType named: (nodes at: 1) ].
	^ type withParameters: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes1: nodes [

	^ { (nodes at: 1) }
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes2: nodes [

	^ (nodes at: 1) , { (nodes at: 3) }
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnionType1: nodes [

	^ TypUnionType types: (nodes at: 2) asIdentitySet
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnknownType1: nodes [

	^ TypUnknownType new
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForVariableType1: nodes [

	^ TypVariableType named: (nodes at: 2) asSymbol
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForVariableType2: nodes [

	^ TypVariableType super: (nodes at: 4) named: (nodes at: 2) asSymbol
]
