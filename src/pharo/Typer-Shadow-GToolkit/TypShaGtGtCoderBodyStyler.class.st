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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBArgumentNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitArrayNode: aLookup [ 
	<typShaMethod: 'visitArrayNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBArrayNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitAssignmentNode: aLookup [ 
	<typShaMethod: 'visitAssignmentNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBAssignmentNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitBlockNode: aLookup [ 
	<typShaMethod: 'visitBlockNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBBlockNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitGlobalNode: aLookup [ 
	<typShaMethod: 'visitGlobalNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBGlobalNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitInstanceVariableNode: aLookup [ 
	<typShaMethod: 'visitInstanceVariableNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBInstanceVariableNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralArrayNode: aLookup [ 
	<typShaMethod: 'visitLiteralArrayNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBLiteralArrayNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitLiteralNode: aLookup [ 
	<typShaMethod: 'visitLiteralNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBLiteralNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMessageNode: aLookup [ 
	<typShaMethod: 'visitMessageNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBMessageNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitMethodNode: aLookup [ 
	<typShaMethod: 'visitMethodNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBMethodNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitReturnNode: aLookup [ 
	<typShaMethod: 'visitReturnNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBReturnNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSelfNode: aLookup [ 
	<typShaMethod: 'visitSelfNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBSelfNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitSuperNode: aLookup [ 
	<typShaMethod: 'visitSuperNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBSuperNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitTemporaryNode: aLookup [ 
	<typShaMethod: 'visitTemporaryNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBTemporaryNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #shadow }
TypShaGtGtCoderBodyStyler >> mVisitThisContextNode: aLookup [ 
	<typShaMethod: 'visitThisContextNode:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | RBThisContextNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType new ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBodyStyler >> vText: aLookup [
	<typShaForVariable: #text>
	^ BlText typAsType
]
