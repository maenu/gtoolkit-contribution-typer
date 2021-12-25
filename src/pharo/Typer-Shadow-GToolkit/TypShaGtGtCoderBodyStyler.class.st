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
				withParameters: {BlTextAttribute typAsType})}
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArgumentNode: aLookup [

	<typShaMethod: 'visitArgumentNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBArgumentNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArrayNode: aLookup [

	<typShaMethod: 'visitArrayNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBArrayNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitAssignmentNode: aLookup [

	<typShaMethod: 'visitAssignmentNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBAssignmentNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitBlockNode: aLookup [

	<typShaMethod: 'visitBlockNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBBlockNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitGlobalNode: aLookup [

	<typShaMethod: 'visitGlobalNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBGlobalNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitInstanceVariableNode: aLookup [

	<typShaMethod: 'visitInstanceVariableNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBInstanceVariableNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralArrayNode: aLookup [

	<typShaMethod: 'visitLiteralArrayNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBLiteralArrayNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralNode: aLookup [

	<typShaMethod: 'visitLiteralNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBLiteralNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMessageNode: aLookup [

	<typShaMethod: 'visitMessageNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBMessageNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMethodNode: aLookup [

	<typShaMethod: 'visitMethodNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBMethodNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitReturnNode: aLookup [

	<typShaMethod: 'visitReturnNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBReturnNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSelfNode: aLookup [

	<typShaMethod: 'visitSelfNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBSelfNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSuperNode: aLookup [

	<typShaMethod: 'visitSuperNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBSuperNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitTemporaryNode: aLookup [

	<typShaMethod: 'visitTemporaryNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBTemporaryNode typAsType }
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitThisContextNode: aLookup [

	<typShaMethod: 'visitThisContextNode:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: TypUnknownType instance
		  arguments: { RBThisContextNode typAsType }
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBodyStyler >> vText: aLookup [
	<typShaVariable: #text>
	^ BlText typAsType
]
