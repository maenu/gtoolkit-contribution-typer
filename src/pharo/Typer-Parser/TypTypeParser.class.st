Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-14T18:10:24.211909+01:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;

<name>
	:[A-Za-z0-9_]+
	| \?
	;

Types
	: Type 'type' { {type} }
	| Types 'types' "","" Type 'type' { types , {type} }
	;
Type
	: ""nil"" {  TypNilType instance  }
	| ""?"" {  TypUnknownType instance  }
	| NullableType 'type' Parameters 'parameters'  { parameters ifEmpty: [ type ] ifNotEmpty: [ type asParametricType: parameters ] }
	| NullableType 'type' Parameters 'parameters' ""->"" NullableType 'result' { TypFunctionType new type: type; parameters: parameters; result: result; yourself }
	| NullableType 'type' ""["" Parameters 'parameters' ""]"" ""->"" NullableType 'result' { TypFunctionType new type: type; parameters: parameters; optionalParameters: true; result: result; yourself }
	;
NullableType
	: Nullable 'nullable' <name> 'name'  { TypNamedType new nullable: nullable; name: name value asSymbol; yourself }
	;
Nullable
	:""!"" { true }
	| { false }
	;
Parameters
	: ""<"" Types 'parameters' "">""  { parameters }
	| { {} }
	;"
]

{ #category : #generated }
TypTypeParser class >> reduceTable [
^#(
	#(15 0 #reduceActionForNullable2:) 
	#(15 1 #reduceActionForNullable1:) 
	#(13 1 #reduceActionForType2:) 
	#(13 1 #reduceActionForType1:) 
	#(12 1 #reduceActionForTypes1:) 
	#(16 0 #reduceActionForParameters2:) 
	#(13 2 #reduceActionForType3:) 
	#(14 2 #reduceActionForNullableType1:) 
	#(12 3 #reduceActionForTypes2:) 
	#(16 3 #liftSecondValue:) 
	#(13 4 #reduceActionForType4:) 
	#(13 6 #reduceActionForType5:)
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
	^ #('"!"' '","' '"->"' '"<"' '">"' '"?"' '"["' '"]"' '"nil"' '<name>' 'B e g i n' 'Types' 'Type' 'NullableType' 'Nullable' 'Parameters' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 6 0 17 0 9 0 6 0 10 0 21 0 12 0 25 0 13 0 29 0 14 0 33 0 15] 
#[0 0 10 0 10] 
#[0 0 14 0 2 0 5 0 17] 
#[0 0 18 0 2 0 5 0 17] 
#[1 0 37 0 2 0 0 0 17] 
#[0 0 22 0 2 0 5 0 17] 
#[1 0 26 0 2 0 26 0 3 0 41 0 4 0 26 0 5 0 45 0 7 0 49 0 16 0 26 0 17] 
#[0 0 53 0 10] 
#[1 0 9 0 1 0 13 0 6 0 17 0 9 0 6 0 10 0 57 0 13 0 29 0 14 0 33 0 15] 
#[1 0 9 0 1 0 13 0 6 0 17 0 9 0 6 0 10 0 61 0 12 0 25 0 13 0 29 0 14 0 33 0 15] 
#[1 0 41 0 4 0 26 0 8 0 65 0 16] 
#[1 0 30 0 2 0 69 0 3 0 30 0 5 0 30 0 17] 
#[0 0 34 0 2 0 3 0 4 0 5 0 7 0 17] 
#[0 0 38 0 2 0 5 0 17] 
#[1 0 37 0 2 0 73 0 5] 
#[0 0 77 0 8] 
#[1 0 9 0 1 0 6 0 10 0 81 0 14 0 33 0 15] 
#[0 0 42 0 2 0 3 0 5 0 8 0 17] 
#[0 0 85 0 3] 
#[0 0 46 0 2 0 5 0 17] 
#[1 0 9 0 1 0 6 0 10 0 89 0 14 0 33 0 15] 
#[0 0 50 0 2 0 5 0 17]
	).
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
TypTypeParser >> reduceActionForNullableType1: nodes [
	^ TypNamedType new
		nullable: (nodes at: 1);
		name: (nodes at: 2) value asSymbol;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForParameters2: nodes [
	^ {}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType1: nodes [
	^ TypNilType instance
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType2: nodes [
	^ TypUnknownType instance
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType3: nodes [
	^ (nodes at: 2)
		ifEmpty: [ nodes at: 1 ]
		ifNotEmpty: [ (nodes at: 1) asParametricType: (nodes at: 2) ]
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType4: nodes [
	^ TypFunctionType new
		type: (nodes at: 1);
		parameters: (nodes at: 2);
		result: (nodes at: 4);
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType5: nodes [
	^ TypFunctionType new
		type: (nodes at: 1);
		parameters: (nodes at: 3);
		optionalParameters: true;
		result: (nodes at: 6);
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
