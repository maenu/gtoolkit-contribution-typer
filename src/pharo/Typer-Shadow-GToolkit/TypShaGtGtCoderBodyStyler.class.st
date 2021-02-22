Class {
	#name : #TypShaGtGtCoderBodyStyler,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBodyStyler class >> shadowedClass [
	^ GtCoderBodyStyler class
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mStyleFromToWith: aLookup [ 
	<typShaMethod: 'styleFrom:to:with:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			(i = 1 or: [ i = 2 ])
				ifTrue: [ Integer typAsType ]
				ifFalse: [ SequenceableCollection typAsType
						copyWithParameters: {BlTextAttribute typAsType} ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArgumentNode: aLookup [
	<typShaMethod: 'visitArgumentNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBArgumentNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArrayNode: aLookup [
	<typShaMethod: 'visitArrayNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBArrayNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitAssignmentNode: aLookup [
	<typShaMethod: 'visitAssignmentNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBAssignmentNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitBlockNode: aLookup [
	<typShaMethod: 'visitBlockNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBBlockNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitGlobalNode: aLookup [
	<typShaMethod: 'visitGlobalNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBGlobalNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitInstanceVariableNode: aLookup [
	<typShaMethod: 'visitInstanceVariableNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBInstanceVariableNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralArrayNode: aLookup [
	<typShaMethod: 'visitLiteralArrayNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBLiteralArrayNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralNode: aLookup [
	<typShaMethod: 'visitLiteralNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBLiteralNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMessageNode: aLookup [
	<typShaMethod: 'visitMessageNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBMessageNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMethodNode: aLookup [
	<typShaMethod: 'visitMethodNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBMethodNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitReturnNode: aLookup [
	<typShaMethod: 'visitReturnNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBReturnNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSelfNode: aLookup [
	<typShaMethod: 'visitSelfNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBSelfNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSuperNode: aLookup [
	<typShaMethod: 'visitSuperNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBSuperNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitTemporaryNode: aLookup [
	<typShaMethod: 'visitTemporaryNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBTemporaryNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitThisContextNode: aLookup [
	<typShaMethod: 'visitThisContextNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBThisContextNode typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBodyStyler >> vText: aLookup [
	<typShaForVariable: #text>
	^ BlText typAsType
]
