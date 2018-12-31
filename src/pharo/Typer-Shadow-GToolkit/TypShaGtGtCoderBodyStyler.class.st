Class {
	#name : #TypShaGtGtCoderBodyStyler,
	#superclass : #TypShaShadow,
	#instVars : [
		'___text'
	],
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtCoderBodyStyler class >> shadowedClass [
	^ GtCoderBodyStyler class
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___styleFrom: _a to: _b with: _c [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			(i = 1 or: [ i = 2 ])
				ifTrue: [ Integer typAsType ]
				ifFalse: [ SequenceableCollection typAsType
						asParametricType: {BlTextAttribute typAsType} ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitArgumentNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBArgumentNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitArrayNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBArrayNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitAssignmentNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBAssignmentNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitBlockNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBBlockNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitGlobalNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBGlobalNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitInstanceVariableNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBInstanceVariableNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitLiteralArrayNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBLiteralArrayNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitLiteralNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBLiteralNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitMessageNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBMessageNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitMethodNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBMethodNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitReturnNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBReturnNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitSelfNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBSelfNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitSuperNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBSuperNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitTemporaryNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | RBTemporaryNode typAsType ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #accessing }
TypShaGtGtCoderBodyStyler >> ___visitThisContextNode: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | {'?' typAsType} at: i ];
		resultType: [ :a :s :r | TypUnknownType instance ];
		yourself
]

{ #category : #initialization }
TypShaGtGtCoderBodyStyler >> initialize [
	super initialize.
	___text := TypVariableResolver new
		type: [ :a :s :r | BlText typAsType ];
		yourself
]
