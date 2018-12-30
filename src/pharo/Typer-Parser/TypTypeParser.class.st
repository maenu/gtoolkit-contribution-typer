Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-30T01:57:53.148059+01:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;
%start Types ;

<name>
	: [A-Za-z0-9_]+
	;
<selector>
	: [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,]+
	| <name>
	| (<name> :)+
	;
<className>
	: <name>
	| <name> "" class""
	;
<methodName>
	: <className> >>\# <selector>
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
	: Nullable 'nullable' ClassName 'name'  { TypNamedType new nullable: nullable; name: name; yourself }
	;
ParametricType
	: NamedType 'type' ""<"" Types 'parameters' "">""  { TypParametricType new nullable: type nullable; name: type name; parameters: parameters; yourself }
	;
FunctionType
	: Nullable 'nullable' MethodName 'name' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: name;  parameters: parameters; result: result; optionalParameters: false; yourself }
	| Nullable 'nullable' ""BlockClosure"" 'name' ""["" EmptyTypes 'parameters' ""]"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: name; parameters: parameters; result: result; optionalParameters: true; yourself }
	| Nullable 'nullable' ""BlockClosure"" 'name' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: name; parameters: parameters; result: result; optionalParameters: false; yourself }
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
ClassName
	: <className> 'className' { className value }
	;
MethodName
	: <methodName> 'methodName' { methodName value }
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
	#(26 0 #reduceActionForNullable2:) 
	#(19 1 #reduceActionForNilType1:) 
	#(26 1 #reduceActionForNullable1:) 
	#(20 1 #reduceActionForUnknownType1:) 
	#(17 1 #reduceActionForTypes1:) 
	#(18 1 #liftFirstValue:) 
	#(27 1 #reduceActionForClassName1:) 
	#(28 1 #reduceActionForClassName1:) 
	#(21 2 #reduceActionForNamedType1:) 
	#(24 3 #reduceActionForUnionType1:) 
	#(17 3 #reduceActionForTypes2:) 
	#(25 0 #reduceActionForEmptyTypes2:) 
	#(22 4 #reduceActionForParametricType1:) 
	#(25 1 #liftFirstValue:) 
	#(23 7 #reduceActionForFunctionType3:) 
	#(23 7 #reduceActionForFunctionType2:)
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
	^ #('"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"BlockClosure"' '"["' '"]"' '"{"' '"}"' '<className>' '<methodName>' 'B e g i n' 'Types' 'Type' 'NilType' 'UnknownType' 'NamedType' 'ParametricType' 'FunctionType' 'UnionType' 'EmptyTypes' 'Nullable' 'ClassName' 'MethodName' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 21 0 17 0 25 0 18 0 25 0 19 0 25 0 20 0 37 0 21 0 25 0 22 0 25 0 23 0 25 0 24 0 53 0 26] 
#[1 0 10 0 3 0 10 0 4 0 10 0 7 0 14 0 9 0 10 0 11 0 10 0 13 0 14 0 14 0 14 0 15 0 10 0 29] 
#[0 0 18 0 3 0 4 0 7 0 11 0 13 0 29] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 57 0 17 0 25 0 18 0 25 0 19 0 25 0 20 0 37 0 21 0 25 0 22 0 25 0 23 0 25 0 24 0 53 0 26] 
#[1 0 61 0 4 0 0 0 29] 
#[0 0 22 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 29] 
#[1 0 26 0 3 0 26 0 4 0 65 0 6 0 26 0 7 0 26 0 11 0 26 0 13 0 26 0 29] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 26 0 3 0 4 0 7 0 11 0 13 0 29] 
#[1 0 69 0 9 0 73 0 14 0 77 0 15 0 81 0 27 0 85 0 28] 
#[1 0 61 0 4 0 89 0 13] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 93 0 18 0 93 0 19 0 93 0 20 0 37 0 21 0 93 0 22 0 93 0 23 0 93 0 24 0 53 0 26] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 97 0 17 0 25 0 18 0 25 0 19 0 25 0 20 0 37 0 21 0 25 0 22 0 25 0 23 0 25 0 24 0 53 0 26] 
#[1 0 101 0 2 0 105 0 10] 
#[0 0 30 0 3 0 4 0 6 0 7 0 11 0 13 0 29] 
#[0 0 34 0 2] 
#[0 0 38 0 3 0 4 0 6 0 7 0 11 0 13 0 29] 
#[0 0 109 0 2] 
#[0 0 42 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 46 0 3 0 4 0 7 0 11 0 13 0 29] 
#[1 0 61 0 4 0 113 0 7] 
#[1 0 9 0 1 0 50 0 3 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 117 0 17 0 25 0 18 0 25 0 19 0 25 0 20 0 37 0 21 0 25 0 22 0 25 0 23 0 25 0 24 0 121 0 25 0 53 0 26] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 50 0 11 0 17 0 12 0 6 0 14 0 6 0 15 0 117 0 17 0 25 0 18 0 25 0 19 0 25 0 20 0 37 0 21 0 25 0 22 0 25 0 23 0 25 0 24 0 125 0 25 0 53 0 26] 
#[1 0 9 0 1 0 50 0 3 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 117 0 17 0 25 0 18 0 25 0 19 0 25 0 20 0 37 0 21 0 25 0 22 0 25 0 23 0 25 0 24 0 129 0 25 0 53 0 26] 
#[0 0 54 0 3 0 4 0 7 0 11 0 13 0 29] 
#[1 0 58 0 3 0 61 0 4 0 58 0 11] 
#[0 0 133 0 3] 
#[0 0 137 0 11] 
#[0 0 141 0 3] 
#[0 0 145 0 5] 
#[0 0 149 0 5] 
#[0 0 153 0 5] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 157 0 18 0 157 0 19 0 157 0 20 0 37 0 21 0 157 0 22 0 157 0 23 0 157 0 24 0 53 0 26] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 161 0 18 0 161 0 19 0 161 0 20 0 37 0 21 0 161 0 22 0 161 0 23 0 161 0 24 0 53 0 26] 
#[1 0 9 0 1 0 13 0 8 0 6 0 9 0 17 0 12 0 6 0 14 0 6 0 15 0 165 0 18 0 165 0 19 0 165 0 20 0 37 0 21 0 165 0 22 0 165 0 23 0 165 0 24 0 53 0 26] 
#[0 0 62 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 66 0 3 0 4 0 7 0 11 0 13 0 29] 
#[0 0 62 0 3 0 4 0 7 0 11 0 13 0 29]
	).
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForClassName1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForEmptyTypes2: nodes [
	^ {}
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType2: nodes [
	^ TypFunctionType new
		nullable: (nodes at: 1);
		name: (nodes at: 2);
		parameters: (nodes at: 4);
		result: (nodes at: 7);
		optionalParameters: true;
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForFunctionType3: nodes [
	^ TypFunctionType new
		nullable: (nodes at: 1);
		name: (nodes at: 2);
		parameters: (nodes at: 4);
		result: (nodes at: 7);
		optionalParameters: false;
		yourself
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
