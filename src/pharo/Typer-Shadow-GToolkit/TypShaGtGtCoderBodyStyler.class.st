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
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{Integer typAsType.
			Integer typAsType.
			(SequenceableCollection typAsType
				copyWithParameters: {BlTextAttribute typAsType})}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArgumentNode: aLookup [
	<typShaMethod: 'visitArgumentNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBArgumentNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArrayNode: aLookup [
	<typShaMethod: 'visitArrayNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBArrayNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitAssignmentNode: aLookup [
	<typShaMethod: 'visitAssignmentNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBAssignmentNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitBlockNode: aLookup [
	<typShaMethod: 'visitBlockNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBBlockNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitGlobalNode: aLookup [
	<typShaMethod: 'visitGlobalNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBGlobalNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitInstanceVariableNode: aLookup [
	<typShaMethod: 'visitInstanceVariableNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBInstanceVariableNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralArrayNode: aLookup [
	<typShaMethod: 'visitLiteralArrayNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBLiteralArrayNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralNode: aLookup [
	<typShaMethod: 'visitLiteralNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBLiteralNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMessageNode: aLookup [
	<typShaMethod: 'visitMessageNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBMessageNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMethodNode: aLookup [
	<typShaMethod: 'visitMethodNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBMethodNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitReturnNode: aLookup [
	<typShaMethod: 'visitReturnNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBReturnNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSelfNode: aLookup [
	<typShaMethod: 'visitSelfNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBSelfNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSuperNode: aLookup [
	<typShaMethod: 'visitSuperNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBSuperNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitTemporaryNode: aLookup [
	<typShaMethod: 'visitTemporaryNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBTemporaryNode typAsType}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitThisContextNode: aLookup [
	<typShaMethod: 'visitThisContextNode:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType new
		arguments: {RBThisContextNode typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBodyStyler >> vText: aLookup [
	<typShaVariable: #text>
	^ BlText typAsType
]
