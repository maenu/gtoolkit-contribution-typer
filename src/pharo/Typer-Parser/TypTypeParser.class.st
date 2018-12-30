Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-30T01:48:22.694603+01:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;
%start Types ;

<name>
	: [A-Za-z0-9_]+
	;
<methodName>
	: <name> >>\# [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,]+
	| <name> >>\# <name>
	| <name> >>\# (<name> :)+
	;

Types
	: Type 'type' { {type} }
	| Types 'types' "","" Type 'type' { types , {type} }
	;
Type
	: UnknownType 'type' { type }
	| UnionType 'type' { type }
	| FunctionType 'type' { type }
	| ParametricType 'type' { type }
	| NamedType 'type' { type }
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
	: NamedType 'type' ""<"" Types 'parameters' "">""  { TypParametricType new nullable: type nullable; name: type name; parameters: parameters; yourself }
	;
FunctionType
	: Nullable 'nullable' <methodName> 'methodName' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name:  methodName value;  parameters: parameters; result: result; optionalParameters: false; yourself }
	| Nullable 'nullable' ""BlockClosure"" ""["" EmptyTypes 'parameters' ""]"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: 'BlockClosure'; parameters: parameters; result: result; optionalParameters: true; yourself }
	| Nullable 'nullable' ""BlockClosure"" ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: 'BlockClosure'; parameters: parameters; result: result; optionalParameters: false; yourself }
	;
UnionType
	: ""{"" Types 'types' ""}"" {  TypUnionType new types: types; yourself  }
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
	: <name> 'name' "" class"" { name value , ' class' }
	| <name> 'name' { name value }
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
	#(27 0 #reduceActionForNullable2:) 
	#(20 1 #reduceActionForNilType1:) 
	#(27 1 #reduceActionForNullable1:) 
	#(21 1 #reduceActionForUnknownType1:) 
	#(18 1 #reduceActionForTypes1:) 
	#(19 1 #liftFirstValue:) 
	#(28 1 #reduceActionForName2:) 
	#(22 2 #reduceActionForNamedType1:) 
	#(25 3 #reduceActionForUnionType1:) 
	#(18 3 #reduceActionForTypes2:) 
	#(26 0 #reduceActionForEmptyTypes2:) 
	#(28 2 #reduceActionForName1:) 
	#(23 4 #reduceActionForParametricType1:) 
	#(26 1 #liftFirstValue:) 
	#(24 7 #reduceActionForFunctionType3:) 
	#(24 7 #reduceActionForFunctionType2:) 
	#(24 7 #reduceActionForFunctionType1:)
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
	^ #('" class"' '"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"BlockClosure"' '"["' '"]"' '"{"' '"}"' '<name>' '<methodName>' 'B e g i n' 'Types' 'Type' 'NilType' 'UnknownType' 'NamedType' 'ParametricType' 'FunctionType' 'UnionType' 'EmptyTypes' 'Nullable' 'Name' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 21 0 18 0 25 0 19 0 25 0 20 0 25 0 21 0 37 0 22 0 25 0 23 0 25 0 24 0 25 0 25 0 53 0 27] 
#[1 0 10 0 4 0 10 0 5 0 10 0 8 0 14 0 10 0 10 0 12 0 10 0 14 0 14 0 15 0 14 0 16 0 10 0 29] 
#[0 0 18 0 4 0 5 0 8 0 12 0 14 0 29] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 57 0 18 0 25 0 19 0 25 0 20 0 25 0 21 0 37 0 22 0 25 0 23 0 25 0 24 0 25 0 25 0 53 0 27] 
#[1 0 61 0 5 0 0 0 29] 
#[0 0 22 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 26 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 26 0 4 0 5 0 8 0 12 0 14 0 29] 
#[1 0 26 0 4 0 26 0 5 0 65 0 7 0 26 0 8 0 26 0 12 0 26 0 14 0 26 0 29] 
#[0 0 26 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 26 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 26 0 4 0 5 0 8 0 12 0 14 0 29] 
#[1 0 69 0 10 0 73 0 15 0 77 0 16 0 81 0 28] 
#[1 0 61 0 5 0 85 0 14] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 89 0 19 0 89 0 20 0 89 0 21 0 37 0 22 0 89 0 23 0 89 0 24 0 89 0 25 0 53 0 27] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 93 0 18 0 25 0 19 0 25 0 20 0 25 0 21 0 37 0 22 0 25 0 23 0 25 0 24 0 25 0 25 0 53 0 27] 
#[1 0 97 0 3 0 101 0 11] 
#[1 0 105 0 1 0 30 0 4 0 30 0 5 0 30 0 7 0 30 0 8 0 30 0 12 0 30 0 14 0 30 0 29] 
#[0 0 109 0 3] 
#[0 0 34 0 4 0 5 0 7 0 8 0 12 0 14 0 29] 
#[0 0 38 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 42 0 4 0 5 0 8 0 12 0 14 0 29] 
#[1 0 61 0 5 0 113 0 8] 
#[1 0 9 0 2 0 46 0 4 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 117 0 18 0 25 0 19 0 25 0 20 0 25 0 21 0 37 0 22 0 25 0 23 0 25 0 24 0 25 0 25 0 121 0 26 0 53 0 27] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 46 0 12 0 17 0 13 0 6 0 15 0 6 0 16 0 117 0 18 0 25 0 19 0 25 0 20 0 25 0 21 0 37 0 22 0 25 0 23 0 25 0 24 0 25 0 25 0 125 0 26 0 53 0 27] 
#[0 0 50 0 4 0 5 0 7 0 8 0 12 0 14 0 29] 
#[1 0 9 0 2 0 46 0 4 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 117 0 18 0 25 0 19 0 25 0 20 0 25 0 21 0 37 0 22 0 25 0 23 0 25 0 24 0 25 0 25 0 129 0 26 0 53 0 27] 
#[0 0 54 0 4 0 5 0 8 0 12 0 14 0 29] 
#[1 0 58 0 4 0 61 0 5 0 58 0 12] 
#[0 0 133 0 4] 
#[0 0 137 0 12] 
#[0 0 141 0 4] 
#[0 0 145 0 6] 
#[0 0 149 0 6] 
#[0 0 153 0 6] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 157 0 19 0 157 0 20 0 157 0 21 0 37 0 22 0 157 0 23 0 157 0 24 0 157 0 25 0 53 0 27] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 161 0 19 0 161 0 20 0 161 0 21 0 37 0 22 0 161 0 23 0 161 0 24 0 161 0 25 0 53 0 27] 
#[1 0 9 0 2 0 13 0 9 0 6 0 10 0 17 0 13 0 6 0 15 0 6 0 16 0 165 0 19 0 165 0 20 0 165 0 21 0 37 0 22 0 165 0 23 0 165 0 24 0 165 0 25 0 53 0 27] 
#[0 0 62 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 66 0 4 0 5 0 8 0 12 0 14 0 29] 
#[0 0 70 0 4 0 5 0 8 0 12 0 14 0 29]
	).
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForEmptyTypes2: nodes [
	^ {}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType1: nodes [
	^ TypFunctionType new
		nullable: (nodes at: 1);
		name: (nodes at: 2) value;
		parameters: (nodes at: 4);
		result: (nodes at: 7);
		optionalParameters: false;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType2: nodes [
	^ TypFunctionType new
		nullable: (nodes at: 1);
		name: 'BlockClosure';
		parameters: (nodes at: 4);
		result: (nodes at: 7);
		optionalParameters: true;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType3: nodes [
	^ TypFunctionType new
		nullable: (nodes at: 1);
		name: 'BlockClosure';
		parameters: (nodes at: 4);
		result: (nodes at: 7);
		optionalParameters: false;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForName1: nodes [
	^ (nodes at: 1) value , ' class'
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForName2: nodes [
	^ (nodes at: 1) value
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
	^ TypParametricType new
		nullable: (nodes at: 1) nullable;
		name: (nodes at: 1) name;
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
	^ TypUnionType new
		types: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnknownType1: nodes [
	^ TypUnknownType instance
]
