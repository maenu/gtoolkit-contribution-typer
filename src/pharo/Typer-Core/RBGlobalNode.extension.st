Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Core' }
RBGlobalNode >> typDefiningTypeIn: aContext [
	<typTypeResultAs: 'Metaclass'>
	| clazz |
	self assert: [ self typHasDefiningTypeIn: aContext ].
	clazz := self methodNode methodClass.
	"lookup pool in defining class"
	self binding typIsFromSharedPool
		ifTrue: [ clazz := (self binding scope "typCastAs OCClassScope") getClass instanceSide sharedPools
				detect: [ :e | e classVarNames includes: self name ] ].
	^ clazz classSide typAsType
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typHasDefiningTypeIn: aContext [
	^ self binding isClassVariable
		or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typTypeRecursiveIn: aContext [
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	(self typHasDefiningTypeIn: aContext)
		ifTrue: [ ^ TypVariableLookupIndex instance
				typeFor:
					(TypVariableLookup new
						receiverType: (self typDefiningTypeIn: aContext);
						selector: self name asSymbol;
						yourself) ].
	^ TypUnknownType instance
]
