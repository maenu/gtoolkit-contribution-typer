Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Core' }
RBGlobalNode >> typDefiningType [
	<typTypeResultAs: 'Metaclass'>
	| clazz |
	self assert: [ self typHasDefiningType ].
	clazz := self methodNode methodClass.
	"lookup pool in defining class"
	self binding typIsFromSharedPool
		ifTrue: [ clazz := (self binding scope "typCastAs OCClassScope") getClass instanceSide sharedPools
				detect: [ :e | e classVarNames includes: self name ] ].
	^ clazz classSide typAsType
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typHasDefiningType [
	^ self binding isClassVariable
		or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typTypeRecursive [
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	self typHasDefiningType
		ifTrue: [ ^ TypVariableLookupIndex instance
				typeFor:
					(TypVariableLookup new
						receiverType: self typDefiningType;
						selector: self name asSymbol;
						yourself) ].
	^ TypUnknownType new
]
