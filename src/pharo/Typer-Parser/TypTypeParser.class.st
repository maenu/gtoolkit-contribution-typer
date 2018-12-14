Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-14T19:25:50.157826+01:00'
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
	| NullableType 'type' ""<"" Types 'parameters' "">""  { type asParametricType: parameters }
	| NullableType 'type' ""("" Types 'parameters' "")"" ""->"" NullableType 'result' { TypFunctionType new type: type; parameters: parameters; result: result; yourself }
	| NullableType 'type' ""["" Types 'parameters' ""]"" ""->"" NullableType 'result' { TypFunctionType new type: type; parameters: parameters; optionalParameters: true; result: result; yourself }
	| NullableType 'type' { type }
	;
NullableType
	: Nullable 'nullable' <name> 'name'  { TypNamedType new nullable: nullable; name: name value asSymbol; yourself }
	;
Nullable
	:""!"" { true }
	| { false }
	;"
]

{ #category : #generated }
TypTypeParser class >> reduceTable [
^#(
	#(17 0 #reduceActionForNullable2:) 
	#(17 1 #reduceActionForNullable1:) 
	#(15 1 #reduceActionForType2:) 
	#(15 1 #reduceActionForType1:) 
	#(14 1 #reduceActionForTypes1:) 
	#(15 1 #liftFirstValue:) 
	#(16 2 #reduceActionForNullableType1:) 
	#(14 3 #reduceActionForTypes2:) 
	#(15 4 #reduceActionForType3:) 
	#(15 6 #reduceActionForType4:) 
	#(15 6 #reduceActionForType5:)
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
	^ #('"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"["' '"]"' '"nil"' '<name>' 'B e g i n' 'Types' 'Type' 'NullableType' 'Nullable' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 8 0 17 0 11 0 6 0 12 0 21 0 14 0 25 0 15 0 29 0 16 0 33 0 17] 
#[0 0 10 0 12] 
#[0 0 14 0 3 0 4 0 7 0 10 0 18] 
#[0 0 18 0 3 0 4 0 7 0 10 0 18] 
#[1 0 37 0 4 0 0 0 18] 
#[0 0 22 0 3 0 4 0 7 0 10 0 18] 
#[1 0 41 0 2 0 26 0 3 0 26 0 4 0 45 0 6 0 26 0 7 0 49 0 9 0 26 0 10 0 26 0 18] 
#[0 0 53 0 12] 
#[1 0 9 0 1 0 13 0 8 0 17 0 11 0 6 0 12 0 57 0 15 0 29 0 16 0 33 0 17] 
#[1 0 9 0 1 0 13 0 8 0 17 0 11 0 6 0 12 0 61 0 14 0 25 0 15 0 29 0 16 0 33 0 17] 
#[1 0 9 0 1 0 13 0 8 0 17 0 11 0 6 0 12 0 65 0 14 0 25 0 15 0 29 0 16 0 33 0 17] 
#[1 0 9 0 1 0 13 0 8 0 17 0 11 0 6 0 12 0 69 0 14 0 25 0 15 0 29 0 16 0 33 0 17] 
#[0 0 30 0 2 0 3 0 4 0 6 0 7 0 9 0 10 0 18] 
#[0 0 34 0 3 0 4 0 7 0 10 0 18] 
#[1 0 73 0 3 0 37 0 4] 
#[1 0 37 0 4 0 77 0 7] 
#[1 0 37 0 4 0 81 0 10] 
#[0 0 85 0 5] 
#[0 0 38 0 3 0 4 0 7 0 10 0 18] 
#[0 0 89 0 5] 
#[1 0 9 0 1 0 6 0 12 0 93 0 16 0 33 0 17] 
#[1 0 9 0 1 0 6 0 12 0 97 0 16 0 33 0 17] 
#[0 0 42 0 3 0 4 0 7 0 10 0 18] 
#[0 0 46 0 3 0 4 0 7 0 10 0 18]
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
TypTypeParser >> reduceActionForType1: nodes [
	^ TypNilType instance
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType2: nodes [
	^ TypUnknownType instance
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType3: nodes [
	^ (nodes at: 1) asParametricType: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType4: nodes [
	^ TypFunctionType new
		type: (nodes at: 1);
		parameters: (nodes at: 3);
		result: (nodes at: 6);
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
