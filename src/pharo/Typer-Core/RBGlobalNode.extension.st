Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Core' }
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

{ #category : #'*Typer-Core' }
RBGlobalNode >> typHasDefiningClass [
	^ self binding isClassVariable
		or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typTypeRecursiveIn: aContext [
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	self typHasDefiningClass
		ifTrue: [ ^ self typDefiningClass typTypeForVariable: self name asSymbol ].
	^ TypUnknownType instance
]
