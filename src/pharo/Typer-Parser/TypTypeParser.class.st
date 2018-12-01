Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-01T17:37:49.896553+01:00'
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
	: NullableType 'type' Parameters 'parameters'  { parameters ifEmpty: [ type ] ifNotEmpty: [ TypParametricType new  type: type; parameters: parameters; yourself ] }
	;
NullableType
	: Nullable 'nullable' <name> 'name'  {  name = '?' ifTrue: [ TypUnknownType instance copy ] ifFalse: [ TypNamedType new nullable: nullable; name: name value asSymbol; yourself ] }
	;
Nullable
	:""!"" { true }
	| { false }
	;
Parameters
	: ""<"" Types 'parameters' "">""  { parameters }
	| {{}}
	;"
]

{ #category : #generated }
TypTypeParser class >> reduceTable [
^#(
	#(10 0 #reduceActionForNullable2:) 
	#(10 1 #reduceActionForNullable1:) 
	#(7 1 #reduceActionForTypes1:) 
	#(11 0 #reduceFor:) 
	#(8 2 #reduceActionForType1:) 
	#(9 2 #reduceActionForNullableType1:) 
	#(7 3 #reduceActionForTypes2:) 
	#(11 3 #liftSecondValue:)
	).
]

{ #category : #generated }
TypTypeParser class >> startingStateForTypes [
	^ 1
]

{ #category : #generated }
TypTypeParser class >> symbolNames [
	^ #('"!"' '","' '"<"' '">"' '<name>' 'B e g i n' 'Types' 'Type' 'NullableType' 'Nullable' 'Parameters' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 6 0 5 0 13 0 7 0 17 0 8 0 21 0 9 0 25 0 10] 
#[0 0 10 0 5] 
#[1 0 29 0 2 0 0 0 12] 
#[0 0 14 0 2 0 4 0 12] 
#[1 0 18 0 2 0 33 0 3 0 18 0 4 0 37 0 11 0 18 0 12] 
#[0 0 41 0 5] 
#[1 0 9 0 1 0 6 0 5 0 45 0 8 0 21 0 9 0 25 0 10] 
#[1 0 9 0 1 0 6 0 5 0 49 0 7 0 17 0 8 0 21 0 9 0 25 0 10] 
#[0 0 22 0 2 0 4 0 12] 
#[0 0 26 0 2 0 3 0 4 0 12] 
#[0 0 30 0 2 0 4 0 12] 
#[1 0 29 0 2 0 53 0 4] 
#[0 0 34 0 2 0 4 0 12]
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
	^ (nodes at: 2) = '?'
		ifTrue: [ TypUnknownType instance copy ]
		ifFalse: [ TypNamedType new
				nullable: (nodes at: 1);
				name:
					(nodes at: 2) value asSymbol;
				yourself ]
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForType1: nodes [
	^ (nodes at: 2)
		ifEmpty: [ nodes at: 1 ]
		ifNotEmpty: [ TypParametricType new
				type: (nodes at: 1);
				parameters: (nodes at: 2);
				yourself ]
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes1: nodes [
	^ {(nodes at: 1)}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForTypes2: nodes [
	^ (nodes at: 1) , {(nodes at: 3)}
]
