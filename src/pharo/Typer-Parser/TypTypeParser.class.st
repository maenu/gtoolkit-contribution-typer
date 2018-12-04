Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-05T00:25:17.587777+01:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;

<name>
	:[A-Za-z0-9_]+
	| \?
	;
<nullable>
	:!
	;

Types
	: Type 'type' { {type} }
	| Types 'types' "","" Type 'type' { types , {type} }
	;
Type
	: ""nil"" {  TypNilType instance  }
	| ""?"" {  TypUnknownType instance  }
	| NullableType 'type' Parameters 'parameters'  { parameters ifEmpty: [ type ] ifNotEmpty: [ type asParametricType: parameters ] }
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
	#(12 0 #reduceActionForNullable2:) 
	#(12 1 #reduceActionForNullable1:) 
	#(10 1 #reduceActionForType2:) 
	#(10 1 #reduceActionForType1:) 
	#(9 1 #reduceActionForTypes1:) 
	#(13 0 #reduceActionForParameters2:) 
	#(10 2 #reduceActionForType3:) 
	#(11 2 #reduceActionForNullableType1:) 
	#(9 3 #reduceActionForTypes2:) 
	#(13 3 #liftSecondValue:)
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
	^ #('"!"' '","' '"<"' '">"' '"?"' '"nil"' '<name>' 'B e g i n' 'Types' 'Type' 'NullableType' 'Nullable' 'Parameters' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 5 0 17 0 6 0 6 0 7 0 21 0 9 0 25 0 10 0 29 0 11 0 33 0 12] 
#[0 0 10 0 7] 
#[0 0 14 0 2 0 4 0 14] 
#[0 0 18 0 2 0 4 0 14] 
#[1 0 37 0 2 0 0 0 14] 
#[0 0 22 0 2 0 4 0 14] 
#[1 0 26 0 2 0 41 0 3 0 26 0 4 0 45 0 13 0 26 0 14] 
#[0 0 49 0 7] 
#[1 0 9 0 1 0 13 0 5 0 17 0 6 0 6 0 7 0 53 0 10 0 29 0 11 0 33 0 12] 
#[1 0 9 0 1 0 13 0 5 0 17 0 6 0 6 0 7 0 57 0 9 0 25 0 10 0 29 0 11 0 33 0 12] 
#[0 0 30 0 2 0 4 0 14] 
#[0 0 34 0 2 0 3 0 4 0 14] 
#[0 0 38 0 2 0 4 0 14] 
#[1 0 37 0 2 0 61 0 4] 
#[0 0 42 0 2 0 4 0 14]
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
TypTypeParser >> reduceActionForTypes1: nodes [
	^ {(nodes at: 1)}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes2: nodes [
	^ (nodes at: 1) , {(nodes at: 3)}
]
