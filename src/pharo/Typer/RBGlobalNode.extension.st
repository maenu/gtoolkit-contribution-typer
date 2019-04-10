Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typDefiningClass [
	<typTypeResultAs: 'Metaclass'>
	| clazz |
	self assert: [ self typHasDefiningClass ].
	clazz := self methodNode methodClass.
	"lookup pool in defining class"
	self binding typIsFromSharedPool
		ifTrue: [ clazz := (self binding scope "typCastAs OCClassScope") getClass instanceSide sharedPools
				detect: [ :e | e classVarNames includes: self name ] ].
	^ clazz classSide
]

{ #category : #'*Typer' }
RBGlobalNode >> typHasDefiningClass [
	<typTypeResultAs: 'Boolean'>
	^ self binding isClassVariable
		or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer' }
RBGlobalNode >> typTypeRecursive [
	(self binding isGlobalClassNameBinding
		or: [ self binding isGlobalVariable ])
		ifTrue: [ ^ self binding value class typAsType ].
	self typHasDefiningClass
		ifTrue: [ ^ self typDefiningClass typTypeForVariable: self name asSymbol ].
	^ TypUnknownType instance
]
