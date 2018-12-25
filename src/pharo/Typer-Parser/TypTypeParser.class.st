Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-23T23:12:06.565839+01:00'
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
EmptyTypes
	: Types 'types' { types }
	| { {} }
	;
Type
	: ""nil"" {  TypNilType instance  }
	| ""?"" {  TypUnknownType instance  }
	| NullableType 'type' ""<"" Types 'parameters' "">""  { type asParametricType: parameters }
	| NullableType 'type' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new type: type; parameters: parameters; result: result; yourself }
	| NullableType 'type' ""["" EmptyTypes 'parameters' ""]"" ""->"" Type 'result' { TypFunctionType new type: type; parameters: parameters; optionalParameters: true; result: result; yourself }
	| NullableType 'type' { type }
	;
NullableType
	: Nullable 'nullable' Name 'name'  { TypNamedType new nullable: nullable; name: name; yourself }
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
	#(19 0 #reduceActionForNullable2:) 
	#(19 1 #reduceActionForNullable1:) 
	#(17 1 #reduceActionForType2:) 
	#(17 1 #reduceActionForType1:) 
	#(15 1 #reduceActionForTypes1:) 
	#(17 1 #liftFirstValue:) 
	#(16 0 #reduceActionForEmptyTypes2:) 
	#(20 1 #reduceActionForName2:) 
	#(18 2 #reduceActionForNullableType1:) 
	#(15 3 #reduceActionForTypes2:) 
	#(16 1 #liftFirstValue:) 
	#(20 2 #reduceActionForName1:) 
	#(17 4 #reduceActionForType3:) 
	#(17 6 #reduceActionForType4:) 
	#(17 6 #reduceActionForType5:)
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
	^ #('" class"' '"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"["' '"]"' '"nil"' '<name>' 'B e g i n' 'Types' 'EmptyTypes' 'Type' 'NullableType' 'Nullable' 'Name' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 13 0 21 0 15 0 25 0 17 0 29 0 18 0 33 0 19] 
#[0 0 10 0 13] 
#[0 0 14 0 4 0 5 0 8 0 11 0 21] 
#[0 0 18 0 4 0 5 0 8 0 11 0 21] 
#[1 0 37 0 5 0 0 0 21] 
#[0 0 22 0 4 0 5 0 8 0 11 0 21] 
#[1 0 41 0 3 0 26 0 4 0 26 0 5 0 45 0 7 0 26 0 8 0 49 0 10 0 26 0 11 0 26 0 21] 
#[1 0 53 0 13 0 57 0 20] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 13 0 61 0 17 0 29 0 18 0 33 0 19] 
#[1 0 9 0 2 0 30 0 4 0 13 0 9 0 17 0 12 0 6 0 13 0 65 0 15 0 69 0 16 0 25 0 17 0 29 0 18 0 33 0 19] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 13 0 73 0 15 0 25 0 17 0 29 0 18 0 33 0 19] 
#[1 0 9 0 2 0 13 0 9 0 30 0 11 0 17 0 12 0 6 0 13 0 65 0 15 0 77 0 16 0 25 0 17 0 29 0 18 0 33 0 19] 
#[1 0 81 0 1 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 7 0 34 0 8 0 34 0 10 0 34 0 11 0 34 0 21] 
#[0 0 38 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 21] 
#[0 0 42 0 4 0 5 0 8 0 11 0 21] 
#[1 0 46 0 4 0 37 0 5 0 46 0 11] 
#[0 0 85 0 4] 
#[1 0 37 0 5 0 89 0 8] 
#[0 0 93 0 11] 
#[0 0 50 0 3 0 4 0 5 0 7 0 8 0 10 0 11 0 21] 
#[0 0 97 0 6] 
#[0 0 54 0 4 0 5 0 8 0 11 0 21] 
#[0 0 101 0 6] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 13 0 105 0 17 0 29 0 18 0 33 0 19] 
#[1 0 9 0 2 0 13 0 9 0 17 0 12 0 6 0 13 0 109 0 17 0 29 0 18 0 33 0 19] 
#[0 0 58 0 4 0 5 0 8 0 11 0 21] 
#[0 0 62 0 4 0 5 0 8 0 11 0 21]
	).
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForEmptyTypes2: nodes [
	^ {}
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
		name: (nodes at: 2);
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
