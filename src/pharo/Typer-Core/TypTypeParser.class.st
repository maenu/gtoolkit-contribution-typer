Class {
	#name : #TypTypeParser,
	#superclass : #SmaCCParser,
	#category : #'Typer-Core-Parser'
}

{ #category : #'generated-accessing' }
TypTypeParser class >> cacheId [
	^'2018-12-30T23:26:20.489239+01:00'
]

{ #category : #generated }
TypTypeParser class >> definitionComment [
"%prefix Typ;
%start Types;

<name>
	: [A-Za-z0-9_]+
	;
<selector>
	: [\~\-\!\@\%\&\*\+\=\\\|\?\/\>\<\,]+
	| (<name> :)+
	| <name>
	;
<className>
	: <name> [ ] class
	| <name>
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
	| Nullable 'nullable' ClassName 'name' ""["" EmptyTypes 'parameters' ""]"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: name; parameters: parameters; result: result; optionalParameters: true; yourself }
	| Nullable 'nullable' ClassName 'name' ""("" EmptyTypes 'parameters' "")"" ""->"" Type 'result' { TypFunctionType new nullable: nullable; name: name; parameters: parameters; result: result; optionalParameters: false; yourself }
	;
UnionType
	: Nullable 'nullable' ""{"" Types 'types' ""}"" {  TypUnionType new nullable: nullable; types: types; yourself  }
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
	#(25 0 #reduceActionForNullable2:) 
	#(18 1 #reduceActionForNilType1:) 
	#(25 1 #reduceActionForNullable1:) 
	#(19 1 #reduceActionForUnknownType1:) 
	#(16 1 #reduceActionForTypes1:) 
	#(17 1 #liftFirstValue:) 
	#(26 1 #reduceActionForClassName1:) 
	#(27 1 #reduceActionForClassName1:) 
	#(20 2 #reduceActionForNamedType1:) 
	#(16 3 #reduceActionForTypes2:) 
	#(24 0 #reduceActionForEmptyTypes2:) 
	#(21 4 #reduceActionForParametricType1:) 
	#(23 4 #reduceActionForUnionType1:) 
	#(24 1 #liftFirstValue:) 
	#(22 7 #reduceActionForFunctionType3:) 
	#(22 7 #reduceActionForFunctionType2:)
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
	^ #('"!"' '"("' '")"' '","' '"->"' '"<"' '">"' '"?"' '"["' '"]"' '"{"' '"}"' '<className>' '<methodName>' 'B e g i n' 'Types' 'Type' 'NilType' 'UnknownType' 'NamedType' 'ParametricType' 'FunctionType' 'UnionType' 'EmptyTypes' 'Nullable' 'ClassName' 'MethodName' 'E O F' 'error')
]

{ #category : #generated }
TypTypeParser class >> transitionTable [
^#(
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 17 0 16 0 21 0 17 0 21 0 18 0 21 0 19 0 33 0 20 0 21 0 21 0 21 0 22 0 21 0 23 0 49 0 25] 
#[1 0 10 0 3 0 10 0 4 0 10 0 7 0 10 0 10 0 14 0 11 0 10 0 12 0 14 0 13 0 14 0 14 0 10 0 28] 
#[0 0 18 0 3 0 4 0 7 0 10 0 12 0 28] 
#[1 0 53 0 4 0 0 0 28] 
#[0 0 22 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 26 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 26 0 3 0 4 0 7 0 10 0 12 0 28] 
#[1 0 26 0 3 0 26 0 4 0 57 0 6 0 26 0 7 0 26 0 10 0 26 0 12 0 26 0 28] 
#[0 0 26 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 26 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 26 0 3 0 4 0 7 0 10 0 12 0 28] 
#[1 0 61 0 11 0 65 0 13 0 69 0 14 0 73 0 26 0 77 0 27] 
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 81 0 17 0 81 0 18 0 81 0 19 0 33 0 20 0 81 0 21 0 81 0 22 0 81 0 23 0 49 0 25] 
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 85 0 16 0 21 0 17 0 21 0 18 0 21 0 19 0 33 0 20 0 21 0 21 0 21 0 22 0 21 0 23 0 49 0 25] 
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 89 0 16 0 21 0 17 0 21 0 18 0 21 0 19 0 33 0 20 0 21 0 21 0 21 0 22 0 21 0 23 0 49 0 25] 
#[0 0 30 0 2 0 3 0 4 0 6 0 7 0 9 0 10 0 12 0 28] 
#[0 0 34 0 2] 
#[1 0 93 0 2 0 38 0 3 0 38 0 4 0 38 0 6 0 38 0 7 0 97 0 9 0 38 0 10 0 38 0 12 0 38 0 28] 
#[0 0 101 0 2] 
#[0 0 42 0 3 0 4 0 7 0 10 0 12 0 28] 
#[1 0 53 0 4 0 105 0 7] 
#[1 0 53 0 4 0 109 0 12] 
#[1 0 9 0 1 0 46 0 3 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 113 0 16 0 21 0 17 0 21 0 18 0 21 0 19 0 33 0 20 0 21 0 21 0 21 0 22 0 21 0 23 0 117 0 24 0 49 0 25] 
#[1 0 9 0 1 0 13 0 8 0 46 0 10 0 6 0 11 0 6 0 13 0 6 0 14 0 113 0 16 0 21 0 17 0 21 0 18 0 21 0 19 0 33 0 20 0 21 0 21 0 21 0 22 0 21 0 23 0 121 0 24 0 49 0 25] 
#[1 0 9 0 1 0 46 0 3 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 113 0 16 0 21 0 17 0 21 0 18 0 21 0 19 0 33 0 20 0 21 0 21 0 21 0 22 0 21 0 23 0 125 0 24 0 49 0 25] 
#[0 0 50 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 54 0 3 0 4 0 7 0 10 0 12 0 28] 
#[1 0 58 0 3 0 53 0 4 0 58 0 10] 
#[0 0 129 0 3] 
#[0 0 133 0 10] 
#[0 0 137 0 3] 
#[0 0 141 0 5] 
#[0 0 145 0 5] 
#[0 0 149 0 5] 
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 153 0 17 0 153 0 18 0 153 0 19 0 33 0 20 0 153 0 21 0 153 0 22 0 153 0 23 0 49 0 25] 
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 157 0 17 0 157 0 18 0 157 0 19 0 33 0 20 0 157 0 21 0 157 0 22 0 157 0 23 0 49 0 25] 
#[1 0 9 0 1 0 13 0 8 0 6 0 11 0 6 0 13 0 6 0 14 0 161 0 17 0 161 0 18 0 161 0 19 0 33 0 20 0 161 0 21 0 161 0 22 0 161 0 23 0 49 0 25] 
#[0 0 62 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 66 0 3 0 4 0 7 0 10 0 12 0 28] 
#[0 0 62 0 3 0 4 0 7 0 10 0 12 0 28]
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
		nullable: (nodes at: 1);
		types: (nodes at: 3);
		yourself
]

{ #category : #'generated-reduction actions' }
TypTypeParser >> reduceActionForUnknownType1: nodes [
	^ TypUnknownType instance
]
